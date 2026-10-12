Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2436548FF8E
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 14:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815671; cv=none; b=qF6G3AUJcQpDl/M474xMMLvo7skTViNeNjn3CAWzMRKuIVayXE2PKms+wrOZ9mi1/nHI71HaccHxCRgTPboY1BKLc9yK1p1ROePA+B9bRBWAe2Z/MuD0YvseeuF0oTGBuoUi4/da+Ve30xDq0mY6EzPWparzRuBmMe8NimyF5SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815671; c=relaxed/simple;
	bh=aOv7ykFy4uXmvjiMz2t4rrjyxkL2c9eBHq7NttYIlUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Rr9hTfjIbflPnMzt3aK/DHOES9BDEWrP10WHIHr7lyUrHbKXoQcsMxH52vjFBquV6UPe1HYGMozVhACZpizdeCRbxgVDiMsMcirlUYOA1pi6wjoUAwMAlLQVU86QT+qPF5GxGYE2mOEa8EJQe0a4ejBvSkA39EZ2kuUcEE7a0DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z/iYP+Wo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z/iYP+Wo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791815668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IKwRz4QUPGDbJdjaFuLMpfA2bqdlLEpCL7HyH6C3+K4=;
	b=Z/iYP+WocovCQ9zpM0XKtsPRfVsz7R1RB5tOINznH9PloujcLEO4pIlsUg2FkPjeOqm1qU
	seyRzXMwPuUM8WMWFHtWnOAUCGRVtoQeNWKDEpudu6sdNegp1hFvXgeKCbTIP0wGjNbMoz
	sM+q8Wt+6NmwMPYpGoz1ZOfKkNIr8Wg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-SGAWVNQgMEuUkMeyWrVA5w-1; Mon, 12 Oct 2026 14:34:27 +0000
X-MC-Unique: SGAWVNQgMEuUkMeyWrVA5w-1
X-Mimecast-MFC-AGG-ID: SGAWVNQgMEuUkMeyWrVA5w_1791815666
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a027f2e364so13415675e9.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 07:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815666; x=1792420466;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IKwRz4QUPGDbJdjaFuLMpfA2bqdlLEpCL7HyH6C3+K4=;
        b=sDy0BZoIsjnjNy0rAj7IR/9QiMAqtRvXPWdizSS2K81472Df9dzxhqxCnkxWiPSid1
         VwCYm/1lWqQVrCycmZ8G+/8wSCM9aJjrlensLiJaxgbim7xnDyvHaQ1FZf4LwbkpilhL
         5K5Ur2UQYlD/RdjJkHydbrFiUmif339MgV3w7M7UQEuoApW/EXyPwMpf7wyh+vJngN+r
         Hue0w6HDm88GsKnX2HPVP22rpZ1pRdcsRJxpuINsK0ZpGLm3/5APvJNcCdols/II1+gI
         KYVhS4W40Q9PYLP5MiTeiDkOPALwswJwYrQmFBds379+DtQ7AlnnmoW2swMfIDtrLaVk
         j0wg==
X-Gm-Message-State: AFq9FYKphaGtcv2OLzqjeQfv3A+RDnzym6YdkzCdfNHye+eBYFEH8KDM
	JGxODWe5C460tZDCdSNxXJ6SVPJ+N9qdfDIrrovZdLI/AeDXjS+EtatSFbPHZwjJGOQcG1pxERe
	qLmvIbyiN2zQ+pYVs1e5fwFqVG45SJMa1jIhNeM8M0TLphLnruRgEH3oqb37KSAVnt6IBpeZEki
	vpSStdJPij8OOqrml4qM3gkieUuwNwIiRMWhnnkmf74ssACj7W0A==
X-Gm-Gg: AYBFou2pAqPE6dhQNQ0QyTZFlQkeFUjrv1esGmq2mDDkOFljcwQMJ0L3ILdUABrZ/jZ
	yBpJW/aUwzdk34UAdL0Z8s0cf+XY+JW1YiHFQdPTUCu9r87xebxGQWUMuKEvj/d/rnIFvUFfQJk
	xPs7M9eDfWj8M1pvDlks48V5VjA3dmGeHnyESgdCEcNDra5YOIaBVOPq60FCTY6dMqSSnY4+K1O
	YjP7zRE+NGJxuCgYbfhfg6Dzf4PoacFI1zcnhmBcE8N7YW4gFzSX7wGzu6Jmkt9DaVMJ9MrKhI1
	D5ZtYiLfjm5cO+YLU4drd2facUV43Fevl7tMghV6O885aegPSaG6UvDVcZM7oiAhGdWp2IHnNb7
	HBKYLqSTWif0lwTnTIlLCQoDsCB/i6NM7
X-Received: by 2002:a05:600c:6749:b0:4a0:1a7f:2abf with SMTP id 5b1f17b1804b1-4a18e49d633mr171855215e9.7.1791815666196;
        Mon, 12 Oct 2026 07:34:26 -0700 (PDT)
X-Received: by 2002:a05:600c:6749:b0:4a0:1a7f:2abf with SMTP id 5b1f17b1804b1-4a18e49d633mr171854335e9.7.1791815665546;
        Mon, 12 Oct 2026 07:34:25 -0700 (PDT)
Received: from mheib-thinkpadp16vgen1.rmtil.csb ([216.128.14.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19471edd5sm355048835e9.11.2026.10.12.07.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:34:25 -0700 (PDT)
Date: Mon, 12 Oct 2026 17:34:01 +0300
From: Mohammad Heib <mheib@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH iwl-next v6 1/2] i40e: move ATR sample rate from ring to
 PF level
Message-ID: <aszuFVtf-LO1O8_7@mheib-thinkpadp16vgen1.rmtil.csb>
References: <20261011134952.54887-1-mheib@redhat.com>
 <20261011134952.54887-2-mheib@redhat.com>
 <sashiko-outbox-168217@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <sashiko-outbox-168217@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5sw7QmopiqCeO9f41M9i7blNauDZds47K3v4SQw8iPA_1791815666
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Oct 12, 2026 at 01:50:32PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] i40e: combined reset flags downgrade reset level to weaker PF_RESET
> --
> 
> commit 6e65935fd380dc5da870cee78bd93449fc30b74c
> Author: Mohammad Heib <mheib@redhat.com>
> 
> i40e: move ATR sample rate from ring to PF level
> 
> This commit moves the ATR sample rate from the per-ring struct to the
> PF struct, initializing it once during software initialization. It also
> triggers a PF reset when re-enabling ATR so that the TX queue HW context
> is appropriately reprogrammed.
> 
> > diff --git a/drivers/net/ethernet/intel/i40e/i40e_ethtool.c b/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
> > index 0ae50d7f34651..bc9b4a2bc23b2 100644
> > --- a/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
> > +++ b/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
> [ ... ]
> >  	if (test_bit(I40E_FLAG_FW_LLDP_DIS, changed_flags))
> >  		reset_needed = I40E_PF_RESET_AND_REBUILD_FLAG;
> >  
> >  	if (test_bit(I40E_FLAG_VEB_STATS_ENA, changed_flags) ||
> >  	    test_bit(I40E_FLAG_LEGACY_RX_ENA, changed_flags) ||
> >  	    test_bit(I40E_FLAG_SOURCE_PRUNING_DIS, changed_flags))
> >  		reset_needed = BIT(__I40E_PF_RESET_REQUESTED);
> 
> [Severity: Medium]
> This problem wasn't introduced by this patch, but does this unconditionally
> overwrite reset_needed? If I40E_FLAG_FW_LLDP_DIS is also in changed_flags,
> it looks like the I40E_PF_RESET_AND_REBUILD_FLAG will be silently dropped.
> 
> >  

Right, as you noted this is pre-existing — the plain '=' assignments
above already clobber earlier reset requests regardless of this patch.

> > +	/* Re-enabling ATR requires a reset to reprogram fd_ena in the
> > +	 * TX queue HW context. Skip when FD_SB (ntuple) is already
> > +	 * enabled, since i40e_configure_tx_ring() sets fd_ena when
> > +	 * either FD flag is active.
> > +	 */
> > +	if (test_bit(I40E_FLAG_FD_ATR_ENA, changed_flags) &&
> > +	    test_bit(I40E_FLAG_FD_ATR_ENA, new_flags) &&
> > +	    !test_bit(I40E_FLAG_FD_SB_ENA, new_flags))
> > +		reset_needed |= BIT(__I40E_PF_RESET_REQUESTED);
> 
> [Severity: Medium]
> If changed_flags contains multiple flags (for instance FW_LLDP_DIS and
> FD_ATR_ENA simultaneously via ethtool), this bitwise OR operation can cause
> reset_needed to contain both I40E_PF_RESET_AND_REBUILD_FLAG and
> BIT(__I40E_PF_RESET_REQUESTED).
> 
> When both flags are set, does this cause the weaker reset to be executed?
> Looking at i40e_do_reset() in i40e_main.c, there is a cascade that checks
> the weaker flag before I40E_PF_RESET_AND_REBUILD_FLAG:
> 
>     } else if (reset_flags & I40E_PF_RESET_FLAG) {
>         ...
>         dev_dbg(&pf->pdev->dev, "PFR requested\n");
>         i40e_handle_reset_warning(pf, lock_acquired);
> 
>     } else if (reset_flags & I40E_PF_RESET_AND_REBUILD_FLAG) {
> 
> This means the requested rebuild from I40E_PF_RESET_AND_REBUILD_FLAG would
> be skipped.
> 
> Also, looking at i40e_handle_reset_warning(), it appears to synchronously call
> i40e_reset_and_rebuild() with reinit set to false, instead of deferring it via
> __I40E_RESET_INTR_RECEIVED:
> 
> static void i40e_handle_reset_warning(struct i40e_pf *pf, bool lock_acquired)
> {
>         i40e_prep_for_reset(pf);
>         i40e_reset_and_rebuild(pf, false, lock_acquired);
> }
> 
> Can this lead to the VSI reinitialization being incorrectly skipped when
> both flags are present?
> 
Good observation, but in practice this cannot happen with the current
code: the '=' assignment for the LLDP path already overwrites
reset_needed before our '|=' runs, so the REBUILD flag is never
present when we OR in the PF reset bit.

That said, I agree the reset_needed handling and the priority ordering
in i40e_do_reset() could use cleanup. I'll look into addressing both
in a separate patch.
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261011134952.54887-1-mheib@redhat.com?part=1

