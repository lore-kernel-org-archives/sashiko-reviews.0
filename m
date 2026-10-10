Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE943043CF
	for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 03:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791601233; cv=none; b=ErTF02N1rmRgVt9bl9DJsNjpeJcKr8xIEMpl7WXuRKzXs6pyIbb/i76D2xHpIHwGvdQeDdE234NLkvpmZuzUEzuQWWOxXNPuRvlg2mQz+HK4mBEY7SVDbEmZmmc4dbQXgfeSvfgHA7uegW5wPL3JEsVr6lvFGPjlKO/pqSGCdn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791601233; c=relaxed/simple;
	bh=gZ8+k9ufZLowqt442HDCu1oAskLTy/jd5B1QbyqS/bA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EPgDiAQTDvX69AGZtE7Tp9bXnOwf1tpd5q84U00EYZQH4Mr9bdsV1NQUBt0jYHsZdeG6MVj1BK9hR9byaUMP4BXPp8p3bp5CSrKWEh+Tg23Y/9HhE2bNhB/pJG0gDOKLaahJEXXaiap4eTM1HL+/ku8auPbhdxmY63ofgTZQ3LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=NMof7q+i; arc=none smtp.client-ip=220.197.31.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="NMof7q+i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=vDtcZj/VCLBdYGH9s88cSPrUid8+FkW8AKAlKKb/4zM=;
	b=NMof7q+i5PPojy4p4j+CqqWCRAEKTTY9vr+ppDzp0sCB0Lveen23SKe0UUW7b7
	gXpUVcmkoVMGhP1T0+27944FS3jh26D/GXrIMhIzDE/QtvBNABM88ALy6q4EAejg
	Lyqi5SDxmgrcBwKtCXd8dC15Y+HCVqJtpe9MlS6ARXk8M=
Message-ID: <3163779c-c7cf-4727-8b42-499f6d4d4101@126.com>
Date: Sat, 10 Oct 2026 11:00:23 +0800
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
X-CM-TRANSID:PikvCgDXB_pHqslqmAATBQ--.23665S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuFWftw4DAFy3ZF1fAry8AFb_yoWxuFykpF
	WFqFyjyrykXrWSg3srZa18WFyj93WrKFy5Gr18KFWSkan8Crn8Jr43Kayj9FW8A393AF1a
	vF4UZ3s5uF98JaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UhZ2fUUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBlAjJoGrJqkh95gAA3v



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
Thank you.  Both reports are about code this series does not touch: the
series only edits ice_sriov.c and ice_vf_lib.c, ice_eswitch.c and
ice_repr.c are unchanged.

 > [High] ice: UAF in NAPI Rx path due to missing RCU grace period after
 > xa_erase

The window is real, but it lives in ice_eswitch_detach(), which neither
this patch nor the other two change:

	ice_eswitch_stop_reprs(pf);
	repr->ops.rem(repr);                    /* unregister_netdev() */
	xa_erase(&pf->eswitch.reprs, repr->id);
	...
	ice_repr_destroy(repr);                 /* free_netdev() + kfree() */

That order is deliberate, and it was chosen for this class of problem:
commit e9942bfe4931 ("ice: Fix use after free during unload with ports in
bridge") moved unregister_netdev() ahead of xa_erase() so that a lookup
racing with the teardown still finds the repr while it is being
unregistered.  Moving that pair, or adding a grace period between the
erase and the destroy, is a change to ice_eswitch_detach() with its own
Fixes: history, not something a cfg_lock ordering fix should carry.

One correction on the mechanism.  ice_eswitch_get_target() is a plain
xa_load() reached from ice_process_skb_fields() when ICE_RX_FLAGS_MULTIDEV
is set on the ring, and a NAPI poll is not an RCU read-side section:
__napi_poll() calls n->poll() directly, and neither net_rx_action() nor
napi_threaded_poll() takes rcu_read_lock().  xa_load() also takes no
reference on the object it returns, so an extra grace period after
xa_erase() would not close this window as the code stands.  The lookup
itself has to be made safe first, and that is a different patch.  I can
send it if you want it.

What this series changes is when ice_eswitch_detach_vf() is called, and
that does not widen the lookup: the NAPI Rx path never took vf->cfg_lock,
so it raced with the detach both before and after.

 > [Medium] net/ice: silent failure to apply VF MAC/VLAN to hardware due
 > to TOCTOU race

The sequence is right, including the outcome: both handlers throw away
the return value of ice_reset_vf(), so once ICE_VF_DIS is up they still
report success while the MAC or VLAN only exists in software.  But every
part of it is baseline.  __ice_set_vf_mac() and ice_set_vf_port_vlan()
call ice_check_vf_ready_for_cfg() outside cfg_lock, ice_reset_vf()'s
ice_is_vf_disabled() test sits after the lock is taken, and ice_free_vfs()
and ice_reset_all_vfs() raise ICE_VF_DIS before entering the loop; the
patch does not move any of the three.  The same window is reachable today
with "echo 0 > sriov_numvfs" in place of a PF reset.

Closing it means changing those two handlers, and probably how the reset
result is reported, which is unrelated to where the detach and the attach
are placed.  I would rather send that on its own than fold it into an
-net series that fixes a lock inversion.

No code change in this series for either report.

