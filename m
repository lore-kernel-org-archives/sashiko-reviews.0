Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DED37B030
	for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 14:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791641093; cv=none; b=Hq9LSiQXD2LXCuNcT7TbqCLJOkPZ+HbD6V7lFFzwoZhyxw29PgAwodomKedkYVM98Y+1BDVB2QD+EUQdczUS9v0LrmNDUXrxvN/SUbaS0l0k5tK3HDolZCgmmRcL13+UuuKW0YVcAqyOmDKuQ1HIvcVy2t3+H2uFvlAYQHy3Efs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791641093; c=relaxed/simple;
	bh=qr6iyEm/OshEfken/YGohrdxnJaZoM55KLgJIks3Vqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JzFIsIWgFed1ExYZ6zwCiCmtIr0KqVX7cewzn8HCCcblGi6lN4AVFngJ7QruxOU3Se48Gpt+K9ApiFAyBNdV7GR537EOf7frdUBEDKIeJ/EiFvz7jRmG7BT/ZnhkJxwgRaCSNZ6hDIlWId9XfanOCZWXe/ZOXPgEe488Foj27lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VmPknaD1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VmPknaD1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A9B1F000FF;
	Sat, 10 Oct 2026 14:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791641092;
	bh=n4yE8HuEQ3KUgwharztXW8BxktHwko7gnKBIcbLgqOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VmPknaD1ZiprxyihZtL3D8N0kow2X7YV1Zf3VqlTCPrqEz3pgghA3AuD9SRZldv/v
	 He+WWZmwcrDh+taLLHYLdi+a+uCbgk8LPSeOin5gV3/m+RNDLDhTt0KlihDtXHvWB8
	 MCjl34jMyNWAo2RktqUaRZvFzTqDkcNT4XEJraRAjWDg5rcjmXCEWvERJLBYP/9wkU
	 EPmgyOHb6eg18kBbs52v9ynJdz+UhE7UO9nHTXpy5cJ0hwpdpIVc4aVv2dtYEDQ0xK
	 tOhdf4btgqgka5l/vmvqHyUzNhrQv+3CS9N9GFp6aOZ4cXbs0L3RwFmzNWQYojFoPa
	 qR9qKFgYM+m7Q==
Date: Sat, 10 Oct 2026 15:04:48 +0100
From: Simon Horman <horms@kernel.org>
To: Linkui Xiao <xiaolinkui@126.com>
Cc: sashiko-reviews@lists.linux.dev, intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH iwl-net v3 1/3] ice: attach and detach VF representors
 outside of vf->cfg_lock
Message-ID: <20261010140448.GO83879@horms.kernel.org>
References: <20261008125754.3520773-1-xiaolinkui@126.com>
 <20261008125754.3520773-2-xiaolinkui@126.com>
 <sashiko-outbox-165586@kernel.org>
 <3163779c-c7cf-4727-8b42-499f6d4d4101@126.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3163779c-c7cf-4727-8b42-499f6d4d4101@126.com>

On Sat, Oct 10, 2026 at 11:00:23AM +0800, Linkui Xiao wrote:
> 
> 
> On 2026/10/9 21:05, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > - [High] ice: UAF in NAPI Rx path due to missing RCU grace period after xa_erase
> > - [Medium] net/ice: silent failure to apply VF MAC/VLAN to hardware due to TOCTOU race
> > --
> > 
> > commit 32649319eb3be01d6b10e730f49f29871e5cb572
> > Author: Linkui Xiao <xiaolinkui@kylinos.cn>
> > 
> > ice: attach and detach VF representors outside of vf->cfg_lock
> > 
> > This patch moves the detach and attach of VF representors outside of
> > the vf->cfg_lock to resolve a lock inversion between cfg_lock, the
> > devlink instance lock, and RTNL.
> > 
> > > diff --git a/drivers/net/ethernet/intel/ice/ice_vf_lib.c b/drivers/net/ethernet/intel/ice/ice_vf_lib.c
> > > --- a/drivers/net/ethernet/intel/ice/ice_vf_lib.c
> > > +++ b/drivers/net/ethernet/intel/ice/ice_vf_lib.c
> > > @@ -789,9 +789,21 @@ void ice_reset_all_vfs(struct ice_pf *pf)
> > >   	/* free VF resources to begin resetting the VSI state */
> > >   	ice_for_each_vf(pf, bkt, vf) {
> > > +		/* Detach the representor before cfg_lock and attach it after
> > > +		 * releasing it again: both take the devlink instance lock and
> > > +		 * then RTNL, while __ice_set_vf_mac(), ice_set_vf_port_vlan()
> > > +		 * and the representor ethtool reset take cfg_lock under RTNL.
> > > +		 * Take cfg_lock once ahead of the detach to wait out a reset
> > > +		 * that is already inside the lock; ICE_VF_DIS, raised above,
> > > +		 * keeps later ones out.
> > > +		 */
> > >   		mutex_lock(&vf->cfg_lock);
> > > +		mutex_unlock(&vf->cfg_lock);
> > >   		ice_eswitch_detach_vf(pf, vf);
> > 
> > [Severity: High]
> > Does this code leave a window for a use-after-free in the NAPI Rx path?
> > 
> > During teardown, ice_eswitch_detach() calls unregister_netdev() which
> > waits for existing RCU readers. However, the representor pointer remains
> > in the eswitch.reprs XArray during and after unregister_netdev().
> > 
> > Because the pointer is still in the XArray, a concurrent NAPI Rx thread
> > calling ice_eswitch_get_target() can successfully fetch it via xa_load()
> > even after unregister_netdev() completes.
> > 
> > The teardown path then removes the pointer via xa_erase() and immediately
> > calls ice_repr_destroy(), executing free_netdev() and kfree() with no
> > additional RCU grace period. If a NAPI thread fetched the pointer just
> > before xa_erase(), it will dereference freed memory.
> > 
> > > +
> > > +		mutex_lock(&vf->cfg_lock);
> > > +
> > >   		vf->driver_caps = 0;
> > >   		ice_vc_set_default_allowlist(vf);
> > >   		ice_vf_fdir_exit(vf);
> > >   		ice_vf_fdir_init(vf);
> > >   		/* clean VF control VSI when resetting VFs since it should be
> > >   		 * setup only when VF creates its first FDIR rule.
> > >   		 */
> > >   		if (vf->ctrl_vsi_idx != ICE_NO_VSI)
> > >   			ice_vf_ctrl_vsi_release(vf);
> > >   		ice_vf_pre_vsi_rebuild(vf);
> > >   		if (ice_vf_rebuild_vsi(vf)) {
> > >   			dev_err(dev, "VF %u VSI rebuild failed, leaving VF disabled\n",
> > >   				vf->vf_id);
> > >   			mutex_unlock(&vf->cfg_lock);
> > >   			continue;
> > >   		}
> > >   		ice_vf_post_vsi_rebuild(vf);
> > > +		mutex_unlock(&vf->cfg_lock);
> > 
> > [Severity: Medium]
> > Does this sequence leave a window where a concurrent VF MAC or VLAN update
> > can silently fail to apply to the hardware?
> > 
> > If a user configures the VF MAC, __ice_set_vf_mac() calls
> > ice_check_vf_ready_for_cfg() before acquiring vf->cfg_lock.
> > 
> > If a PF reset occurs simultaneously, ice_reset_all_vfs() sets ICE_VF_DIS
> > globally. If this happens right after __ice_set_vf_mac() passes its check,
> > __ice_set_vf_mac() will wait to acquire vf->cfg_lock.
> > 
> > As seen in the lines above, ice_reset_all_vfs() acquires vf->cfg_lock and
> > rebuilds the VF VSI using the old MAC address. After ice_reset_all_vfs()
> > releases the lock, __ice_set_vf_mac() acquires it, updates the software
> > MAC, and calls ice_reset_vf().
> > 
> > Because ICE_VF_DIS is still set by the PF reset, ice_reset_vf() aborts
> > the hardware reprogram. __ice_set_vf_mac() then returns success based on
> > its earlier check, leaving the hardware enforcing the old MAC while
> > software tools report the new one.
> > 
> Thank you.  Both reports are about code this series does not touch: the
> series only edits ice_sriov.c and ice_vf_lib.c, ice_eswitch.c and
> ice_repr.c are unchanged.
> 
> > [High] ice: UAF in NAPI Rx path due to missing RCU grace period after
> > xa_erase
> 
> The window is real, but it lives in ice_eswitch_detach(), which neither
> this patch nor the other two change:
> 
> 	ice_eswitch_stop_reprs(pf);
> 	repr->ops.rem(repr);                    /* unregister_netdev() */
> 	xa_erase(&pf->eswitch.reprs, repr->id);
> 	...
> 	ice_repr_destroy(repr);                 /* free_netdev() + kfree() */
> 
> That order is deliberate, and it was chosen for this class of problem:
> commit e9942bfe4931 ("ice: Fix use after free during unload with ports in
> bridge") moved unregister_netdev() ahead of xa_erase() so that a lookup
> racing with the teardown still finds the repr while it is being
> unregistered.  Moving that pair, or adding a grace period between the
> erase and the destroy, is a change to ice_eswitch_detach() with its own
> Fixes: history, not something a cfg_lock ordering fix should carry.
> 
> One correction on the mechanism.  ice_eswitch_get_target() is a plain
> xa_load() reached from ice_process_skb_fields() when ICE_RX_FLAGS_MULTIDEV
> is set on the ring, and a NAPI poll is not an RCU read-side section:
> __napi_poll() calls n->poll() directly, and neither net_rx_action() nor
> napi_threaded_poll() takes rcu_read_lock().  xa_load() also takes no
> reference on the object it returns, so an extra grace period after
> xa_erase() would not close this window as the code stands.  The lookup
> itself has to be made safe first, and that is a different patch.  I can
> send it if you want it.
> 
> What this series changes is when ice_eswitch_detach_vf() is called, and
> that does not widen the lookup: the NAPI Rx path never took vf->cfg_lock,
> so it raced with the detach both before and after.
> 
> > [Medium] net/ice: silent failure to apply VF MAC/VLAN to hardware due
> > to TOCTOU race
> 
> The sequence is right, including the outcome: both handlers throw away
> the return value of ice_reset_vf(), so once ICE_VF_DIS is up they still
> report success while the MAC or VLAN only exists in software.  But every
> part of it is baseline.  __ice_set_vf_mac() and ice_set_vf_port_vlan()
> call ice_check_vf_ready_for_cfg() outside cfg_lock, ice_reset_vf()'s
> ice_is_vf_disabled() test sits after the lock is taken, and ice_free_vfs()
> and ice_reset_all_vfs() raise ICE_VF_DIS before entering the loop; the
> patch does not move any of the three.  The same window is reachable today
> with "echo 0 > sriov_numvfs" in place of a PF reset.
> 
> Closing it means changing those two handlers, and probably how the reset
> result is reported, which is unrelated to where the detach and the attach
> are placed.  I would rather send that on its own than fold it into an
> -net series that fixes a lock inversion.
> 
> No code change in this series for either report.

Thanks for the detailed response.
This seems reasonable to me.

Reviewed-by: Simon Horman <horms@kernel.org>

