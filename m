Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6DC23ABA8;
	Sun, 31 May 2026 01:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780192269; cv=none; b=Ww2PANncMRhlAO3JvhlrCNbb20wvqtUZxSmW+uQYJE2vkWbDBE3G1ZCcdlC9RzG0vcstipC4obVbPddVQ8tYRgnBKFLb4EO/bvPZuD+7vEbmxn9nNuH8JNUadkPl5CUqhdCoc38cqDkmTiuJ6ZV/8x3Ou+ojIYXbql+B2xBfiCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780192269; c=relaxed/simple;
	bh=qj66EnOUwx35wGckzcnJeWUyOIceOPznqQSdoew23rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j16Dnj3BjZR+mRCB1Ukfg4D5DrIAhp5CRgQOQUmLBGcm/LHWK73zG5CBPH+eKOrDC1qM1Xb2fVApbPHxXY61UzVjWQRl2sLut1/s+85POtgc5ZKTLs23Vf3PKVi98pYdYl/BnvvUfwJzWVw+8aO639Nwys+9NraTX2npbWXyDwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aIjw3YAl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aIjw3YAl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1442B1F00893;
	Sun, 31 May 2026 01:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780192268;
	bh=WPSc7fJ5oaSBruD19/xQTe5sdqQxApZqM7qkzeRpPzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aIjw3YAlRM0qG9d/Lzt7gIueLDRY6Uq/rktbeApM6HpdC30lVDl6Q+y8LMts6q1BI
	 UJ/GyUXeLvkZE2EQd4hpGD4bu4yHhSwnXxhTjpeJBytrpqCE3e1SprChOAng/BtOBm
	 zHgilj/3lETSIWp2jN0iD/j5zAY6Qj55P+yF3obgvRz11Y5qQkAYIGT3lTQ+NmH72o
	 MMWRNd1/EgRg6QhkuHnt/yIJPkX4m2UlFYFtMmNLCJl0tv67CZshspDyXLULpLdavp
	 aY5phWdroarHAgxKlEkNv5k+DWO64Up9peVWrxfQd3ZV26zf2onI04IpWBk9C5d8fv
	 zq1eZqueAZH9Q==
Date: Sat, 30 May 2026 18:50:57 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v5 15/18] riscv_cbqri: resctrl: Add mbm_total_bytes
 bandwidth monitoring
Message-ID: <ahuUAQk-qufagp9a@gen8>
References: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-15-78d3a7ba9dbe@kernel.org>
 <20260525012742.7007E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525012742.7007E1F000E9@smtp.kernel.org>

On Mon, May 25, 2026 at 01:27:42AM +0000, sashiko-bot@kernel.org wrote:
> > +		if (rmid >= bc->mcid_count) {
> > +			err = -ERANGE;
> > +			break;
> > +		}
> 
> This is a pre-existing issue, but will the core allocate out-of-bounds
> RMIDs that trigger this -ERANGE error? Looking at
> cbqri_resctrl_control_init(), num_rmid is bound to the local capacity
> rather than the global minimum (max_rmid). Could this lead to stale
> monitoring state and bypass the max_rmid-bounded reset loop?

I will fix in the revision.

> > +	if (l3_count > 1) {
> > +		pr_warn_once("multiple L3 domains (%u) detected. mbm_total_bytes disabled\n",
> > +			     l3_count);
> > +		return;
> > +	}
> 
> When mbm_total_bytes is disabled here, will the unused Bandwidth
> Controller's smaller mcid_count still artificially clamp the global
> max_rmid in cbqri_resctrl_accumulate_caps()? The unused BC remains
> mon_capable, which might restrict valid occupancy monitoring system-wide.

I will change it to walk only the controllers that were actually picked
as counter sources. 

> > +	hw_dom->paired_bc = cbqri_find_only_mon_bc();
> > +	if (hw_dom->paired_bc) {
> > +		err = cbqri_init_bc_mon_counters(hw_dom->paired_bc);
> 
> If mbm_total_bytes was disabled in cbqri_resctrl_pick_counters() due to
> multiple L3 domains, does this unconditionally allocate memory and issue
> MMIO resets for an unused BC? Could an initialization failure in this unused
> BC cause the entire L3 bringup to abort here?

I will change to skip the init when mbm_total_bytes is disabled.

> >  	cancel_delayed_work(&mon_dom->cqm_limbo);
> > +	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
> > +		cancel_delayed_work(&mon_dom->mbm_over);
> >  	resctrl_offline_mon_domain(res, &mon_dom->hdr);
> >  err_listdel:
> >  	list_del(&mon_dom->hdr.list);
> >  err_free:
> >  	kfree(mon_dom);
> >  	return err;
> >  }
> 
> [Severity: Critical]
> This is a pre-existing issue, but since this patch introduces a new trigger
> instance for mbm_over, does this create a use-after-free window?
> 
> Since cancel_delayed_work() is used without _sync, if a worker is currently
> stalled waiting on the cpus_read_lock, won't kfree(mon_dom) execute
> synchronously here? Once the write lock is dropped, couldn't the pending
> worker resume and dereference the freed memory?

I will address in the change to patch 12.

Drew
