Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F351544AB95
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 08:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795269; cv=none; b=LFP+SU/YhuSa/0bkFWRkN8NPfszIRgxAUuNI8j1DDHcv25BhUG10M199wc+efq1aO/R2xbXWq6qpAOvNpUjv6sr5XiqfFzBYLZRH0VyyOIYCplIR8MPDNp6cGSg66V94AWxPQh/wrs2RrHHt/HWydLHk0G7iJsHa9OUc49BchZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795269; c=relaxed/simple;
	bh=b/I9uv6tQpG7A/DkHfe5jFSqN3iCjdym1oHayjrFrdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HcYiwobxEw+2cOPhzKxecGIMmvqPoWaN2XGjMT7jXNKQ4a8pkw+eONuDAy+rx1fQASOIa4X+ohBwxaV9NbXITiMMAGSGUPR7UclnP8WbWvnoazLK7QvX1m02cQW3UkFB4OtHnBR7KBCeGCBZSjDNH6TqFzIo4eRzTEAjuLv/HKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=iM5qQkUt; arc=none smtp.client-ip=117.135.210.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="iM5qQkUt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=BJxenIXhdUqi9K52gMrSLjgLCaVLYoX3mxZ0/mSG73Y=;
	b=iM5qQkUtnmRfurR4SEl7gFzbI+fELaJvsrHpjL7Ut01XlmZG/SxCLYxnii5oZH
	4YCleWZiV7XUPnRNevE5LfShrLedB2m4LhcPxE1J/IO95bXfr420KcxdTwNluXtP
	glCDioV7z7eLZ1RNbKAvdjM/QEn4vVz1G7q6mqk/9M/L0=
Message-ID: <33c171df-0687-4fbc-9650-1b692dfab3b1@126.com>
Date: Mon, 12 Oct 2026 16:54:21 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-net v3 1/3] ice: attach and detach VF representors
 outside of vf->cfg_lock
To: sashiko-reviews@lists.linux.dev
Cc: intel-wired-lan@lists.osuosl.org
References: <20261008125754.3520773-1-xiaolinkui@126.com>
 <20261008125754.3520773-2-xiaolinkui@126.com>
 <sashiko-outbox-165586@kernel.org>
Content-Language: en-US
From: Linkui Xiao <xiaolinkui@126.com>
In-Reply-To: <sashiko-outbox-165586@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wD31wQ9oMxqhvfGBA--.54952S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuryDKw47ur1rtF4fGF4fGrg_yoW7JFykpa
	95XFWjkrykXr1Ig3srXw4UuFy0934rKFy5Gr1rKF4S9an8Cr1DAr47KFWjvFy8A3s3A3Wa
	vr4DZwn5ZF98JaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UhXocUUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBqB4F22rMoD6pmAAA3h



On 2026/10/9 21:05, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] ice: UAF in NAPI Rx path due to missing RCU grace period after xa_erase
> - [Medium] net/ice: silent failure to apply VF MAC/VLAN to hardware due to TOCTOU race
> --
> 
> commit 32649319eb3be01d6b10e730f49f29871e5cb572
> Author: Linkui Xiao <xiaolinkui@kylinos.cn>
> 
> ice: attach and detach VF representors outside of vf->cfg_lock
> 
> This patch moves the detach and attach of VF representors outside of
> the vf->cfg_lock to resolve a lock inversion between cfg_lock, the
> devlink instance lock, and RTNL.
> 
>> diff --git a/drivers/net/ethernet/intel/ice/ice_vf_lib.c b/drivers/net/ethernet/intel/ice/ice_vf_lib.c
>> --- a/drivers/net/ethernet/intel/ice/ice_vf_lib.c
>> +++ b/drivers/net/ethernet/intel/ice/ice_vf_lib.c
>> @@ -789,9 +789,21 @@ void ice_reset_all_vfs(struct ice_pf *pf)
>>   
>>   	/* free VF resources to begin resetting the VSI state */
>>   	ice_for_each_vf(pf, bkt, vf) {
>> +		/* Detach the representor before cfg_lock and attach it after
>> +		 * releasing it again: both take the devlink instance lock and
>> +		 * then RTNL, while __ice_set_vf_mac(), ice_set_vf_port_vlan()
>> +		 * and the representor ethtool reset take cfg_lock under RTNL.
>> +		 * Take cfg_lock once ahead of the detach to wait out a reset
>> +		 * that is already inside the lock; ICE_VF_DIS, raised above,
>> +		 * keeps later ones out.
>> +		 */
>>   		mutex_lock(&vf->cfg_lock);
>> +		mutex_unlock(&vf->cfg_lock);
>>   
>>   		ice_eswitch_detach_vf(pf, vf);
> 
> [Severity: High]
> Does this code leave a window for a use-after-free in the NAPI Rx path?
> 
> During teardown, ice_eswitch_detach() calls unregister_netdev() which
> waits for existing RCU readers. However, the representor pointer remains
> in the eswitch.reprs XArray during and after unregister_netdev().
> 
> Because the pointer is still in the XArray, a concurrent NAPI Rx thread
> calling ice_eswitch_get_target() can successfully fetch it via xa_load()
> even after unregister_netdev() completes.
> 
> The teardown path then removes the pointer via xa_erase() and immediately
> calls ice_repr_destroy(), executing free_netdev() and kfree() with no
> additional RCU grace period. If a NAPI thread fetched the pointer just
> before xa_erase(), it will dereference freed memory.
> 
>> +
>> +		mutex_lock(&vf->cfg_lock);
>> +
>>   		vf->driver_caps = 0;
>>   		ice_vc_set_default_allowlist(vf);
>>   
>>   		ice_vf_fdir_exit(vf);
>>   		ice_vf_fdir_init(vf);
>>   		/* clean VF control VSI when resetting VFs since it should be
>>   		 * setup only when VF creates its first FDIR rule.
>>   		 */
>>   		if (vf->ctrl_vsi_idx != ICE_NO_VSI)
>>   			ice_vf_ctrl_vsi_release(vf);
>>   
>>   		ice_vf_pre_vsi_rebuild(vf);
>>   		if (ice_vf_rebuild_vsi(vf)) {
>>   			dev_err(dev, "VF %u VSI rebuild failed, leaving VF disabled\n",
>>   				vf->vf_id);
>>   			mutex_unlock(&vf->cfg_lock);
>>   			continue;
>>   		}
>>   		ice_vf_post_vsi_rebuild(vf);
>>   
>> +		mutex_unlock(&vf->cfg_lock);
> 
> [Severity: Medium]
> Does this sequence leave a window where a concurrent VF MAC or VLAN update
> can silently fail to apply to the hardware?
> 
> If a user configures the VF MAC, __ice_set_vf_mac() calls
> ice_check_vf_ready_for_cfg() before acquiring vf->cfg_lock.
> 
> If a PF reset occurs simultaneously, ice_reset_all_vfs() sets ICE_VF_DIS
> globally. If this happens right after __ice_set_vf_mac() passes its check,
> __ice_set_vf_mac() will wait to acquire vf->cfg_lock.
> 
> As seen in the lines above, ice_reset_all_vfs() acquires vf->cfg_lock and
> rebuilds the VF VSI using the old MAC address. After ice_reset_all_vfs()
> releases the lock, __ice_set_vf_mac() acquires it, updates the software
> MAC, and calls ice_reset_vf().
> 
> Because ICE_VF_DIS is still set by the PF reset, ice_reset_vf() aborts
> the hardware reprogram. __ice_set_vf_mac() then returns success based on
> its earlier check, leaving the hardware enforcing the old MAC while
> software tools report the new one.
> 
Hi,

Thanks for the review. I did not modify the original patch, but both issues
reported here are now addressed by separate patches sent to netdev:

[High] UAF in NAPI Rx path:
   https://lore.kernel.org/all/20261012072959.254206-1-xiaolinkui@126.com/

   This patch erases the xarray entry first, then adds synchronize_net()
   before the representor is freed, and holds the RCU read lock around the
   netdev usage in ice_process_skb_fields().

[Medium] silent failure to apply VF MAC/VLAN due to TOCTOU race:
 
https://lore.kernel.org/netdev/20261012082910.283229-1-xiaolinkui@126.com/

   This patch addresses the race between 
__ice_set_vf_mac()/ice_set_vf_port_vlan()
   and the PF reset path.

Both patches are independent of the original series and were not included in
a repost of it.

Thanks,
Linkui

