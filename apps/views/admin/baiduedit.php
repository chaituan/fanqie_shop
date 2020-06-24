<script>
    if("undefined" != typeof UE) {
        UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
        UE.Editor.prototype.getActionUrl = function (action) {
            if (action == 'uploadimage' || action == 'uploadscrawl') {
                return '<?php echo site_url('adminct/widget/images/upload') ?>';
            } else if (action == 'uploadvideo') {
                return '';
            } else {
                return this._bkGetActionUrl.call(this, action);
            }
        }
    }
</script>
