Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8964377A8A
	for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 14:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791641133; cv=none; b=r6TlIFjlaOPxX9EBuwEmTLXFLMpXPhOM377fJ9s/uU9IH1zzLUNVhAlBiEm7x9qDcwEkF9xCagIOAFJr59mfyh/N7jFOPDP44LI6dFDpQ43qIY/1tw3HU0PWOwxFch9o0yK3cXjzJIpx4tx0SX0BaMCpgnqITaSjT8mWhQjVyV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791641133; c=relaxed/simple;
	bh=fQRhCnby94GwCGN12rhGE+aXl0HJ3sT33930ueThczg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tSQFIHloIvErmHDqlU7/jz0DgrXhosQICVCQSYs3ZUvrVv0644CHscykw42WLvC5gdD+Ir5tptNFi04Abp8O6Im3M6iF0lJquApT5XGmAVpIi5TD1AuW2A10QNQhlfm07fDiEHuNRHmcVma0ePkJ2WcDl/zIu8EXNoPy79xtRZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9C0CQ3V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9C0CQ3V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9DF1F000FF;
	Sat, 10 Oct 2026 14:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791641131;
	bh=cvFPTAQxDXIlbchmR2MXtaPjfdx7iEJiJUHoag0ON9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l9C0CQ3V9qEMS3prByZE4s7cjQ5doUMT8vX0/ON3vo5JSN0MxXPRnE0G0C1RNCKbo
	 JfQOTy+Dp9oJGgbSxLx4xV7P0dVwNAioGVM9n8gUMbNyJLBQKXfu8e/b0RFJrzFrNq
	 r1i031BlsRAWs9y8MKYEze3BXh8SCQNcUjQm1XRdXBMB0WcgSmgh1f2Qaj9TxfvoDy
	 nxjP07mKMUoUeBZzeNppTcw02+yPRRfp6EqCQKoqwivOx6h51lu07QRdXisn2tXSUR
	 CJ15W9bevgEpvClxmsBzBNnk4kCwgV1XUVswH8FXnDqi6ZwxIbOnHAQ83xjMI3xk7l
	 tE89tLD6USvYw==
Date: Sat, 10 Oct 2026 15:05:28 +0100
From: Simon Horman <horms@kernel.org>
To: Linkui Xiao <xiaolinkui@126.com>
Cc: sashiko-reviews@lists.linux.dev, intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH iwl-net v3 2/3] ice: detach the VF representor when
 ice_start_vfs() fails
Message-ID: <20261010140528.GP83879@horms.kernel.org>
References: <20261008125754.3520773-1-xiaolinkui@126.com>
 <20261008125754.3520773-3-xiaolinkui@126.com>
 <sashiko-outbox-165587@kernel.org>
 <c4f9c654-614a-44c9-b96a-31883df45e4b@126.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4f9c654-614a-44c9-b96a-31883df45e4b@126.com>

On Sat, Oct 10, 2026 at 10:42:49AM +0800, Linkui Xiao wrote:
> 
> On 2026/10/9 21:05, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [High] ice: ABBA deadlock between pf->vfs.table_lock, devl_lock, and rtnl_lock
> > --
> > 
> > commit e31928012cb273c164e36248e1b33c296e805e8d
> > Author: Linkui Xiao <xiaolinkui@kylinos.cn>
> > 
> > ice: detach the VF representor when ice_start_vfs() fails
> > 
> > This commit modifies the error teardown path of ice_start_vfs() to explicitly
> > detach the VF representor. This prevents memory leaks, use-after-free
> > scenarios, and stale configuration states.
> > 
> > > diff --git a/drivers/net/ethernet/intel/ice/ice_sriov.c b/drivers/net/ethernet/intel/ice/ice_sriov.c
> > > index bf6410c0d85d4..13d97dbd517c8 100644
> > > --- a/drivers/net/ethernet/intel/ice/ice_sriov.c
> > > +++ b/drivers/net/ethernet/intel/ice/ice_sriov.c
> > [ ... ]
> > > @@ -520,8 +520,27 @@ static int ice_start_vfs(struct ice_pf *pf)
> > [ ... ]
> > > +		/* Mark the VF disabled before its representor and its VSI go
> > > +		 * away, the way ice_free_vfs() does, and take cfg_lock
> > > +		 * around it to wait out an ice_reset_vf() already in
> > > +		 * progress. pf->state has no ICE_VF_DIS on this path and the
> > > +		 * loop leaves ICE_VF_STATE_INIT set, so without the bit a
> > > +		 * concurrent ice_reset_vf() would pass ice_is_vf_disabled()
> > > +		 * and reach ice_eswitch_update_repr() on a destroyed
> > > +		 * representor, or trip WARN_ON(!vsi) in ice_dis_vf_mappings().
> > > +		 */
> > > +		mutex_lock(&vf->cfg_lock);
> > > +		set_bit(ICE_VF_STATE_DIS, vf->vf_states);
> > > +		mutex_unlock(&vf->cfg_lock);
> > > +
> > > +		/* detach outside of cfg_lock, see ice_free_vfs() */
> > > +		ice_eswitch_detach_vf(pf, vf);
> > 
> > [Severity: High]
> > Does this introduce an ABBA deadlock involving pf->vfs.table_lock, devl_lock,
> > and rtnl_lock?
> > 
> > ice_start_vfs() runs with pf->vfs.table_lock held. Adding a call to
> > ice_eswitch_detach_vf() here establishes a lock acquisition order of:
> > 
> > table_lock -> devl_lock (acquired in ice_eswitch_detach_vf) -> rtnl_lock
> > (acquired via unregister_netdev in ice_repr_rem_vf).
> > 
> > However, there is an opposing lock acquisition order during TC mqprio
> > configuration:
> > 
> > rtnl_lock (held during ndo_setup_tc) -> devl_lock (acquired in
> > ice_tear_down_devlink_rate_tree) -> table_lock (acquired right after
> > devl_lock in ice_tear_down_devlink_rate_tree).
> > 
> > If a user enables SR-IOV, triggering an error in ice_start_vfs(), while
> > concurrently configuring TC mqprio, could this opposing lock acquisition
> > order result in a deadlock?
> > 
> > > +
> > > +		mutex_lock(&vf->cfg_lock);
> > >   		ice_dis_vf_mappings(vf);
> > >   		ice_vf_vsi_release(vf);
> > > +		mutex_unlock(&vf->cfg_lock);
> > > +
> > >   		it_cnt--;
> > >   	}
> > > 
> > 
> Thanks for the review.
> 
> I agree that the three lock orders do not converge, but I do not think
> this patch introduces the inversion, and the cycle is reachable without
> it.
> 
> ice_start_vfs() already runs under pf->vfs.table_lock and already takes
> devl_lock with that lock held, before any failure can happen. Its
> forward loop does
> 
> 	if (ice_is_eswitch_mode_switchdev(pf)) {
> 		retval = ice_eswitch_attach_vf(pf, vf);
> 		...
> 	}
> 
> and ice_eswitch_attach_vf() takes devl_lock() around
> ice_eswitch_attach(). The teardown loop unwinds only the VFs whose
> attach succeeded -- it walks the VFs in the same order and stops once
> it_cnt reaches 0 -- so whenever the ice_eswitch_detach_vf() added here
> can reach devl_lock(), an ice_eswitch_attach_vf() has already taken it
> earlier in the same call, under the same table_lock. In legacy mode
> there are no representors to begin with: ice_eswitch_detach_vf()
> returns at its xa_load() before reaching devl_lock(), and nothing
> attached either. Either way, table_lock -> devl_lock is not a new pair
> here.
> 
> The full table_lock -> devl_lock -> rtnl_lock chain is pre-existing
> too. The other two callers of the same helper hold table_lock and reach
> RTNL through it:
> 
> 	ice_free_vfs()        table_lock -> ice_eswitch_detach_vf()
> 	ice_reset_all_vfs()                  -> devl_lock()
> 	                                     -> repr->ops.rem()
> 	                                     -> ice_repr_rem_vf()
> 	                                     -> unregister_netdev()
> 
> That is in the baseline, not added by the series, and the opposite
> order, rtnl_lock -> devl_lock -> table_lock in
> ice_tear_down_devlink_rate_tree() reached from ndo_setup_tc, is equally
> untouched. So "echo 0 > sriov_numvfs" racing a TC mqprio configuration
> can reach both halves today. This is the same pair that was raised in
> the v1 review, and the conclusion has not changed.
> 
> That said, the two orders do not converge, and converging them is worth
> doing. It means taking devl_lock outside pf->vfs.table_lock in
> ice_ena_vfs(), ice_free_vfs() and ice_reset_all_vfs(), plus variants of
> ice_eswitch_attach_vf() and ice_eswitch_detach_vf() that expect
> devl_lock() to be held, since devl_lock() is a plain mutex and the
> helpers take it internally. That is a lock hierarchy change across
> three callers and the eswitch API, and it is unrelated to the
> cfg_lock -> RTNL inversion this series is about, so I would rather send
> it as a separate series than carry it in an iwl-net fix that has to be
> backported to stable.
> 
> No code change in this series for this report.

Thanks for the detailed response.
This seems reasonable to me.

Reviewed-by: Simon Horman <horms@kernel.org>

