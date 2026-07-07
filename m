Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBA7414A07
	for <sashiko-reviews@lists.linux.dev>; Tue,  7 Jul 2026 13:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430199; cv=none; b=dJKsdAg+OCMZCvY27SjSc0GvvVhIq90rNjYMMexS9Szh5Hwd2GP24OkgA4fnEEJL3qs3Dy+Y34K9gWB+LRPO8BnUnZaufa94nP3speFazSyODDN3SflMZI1Euu+gUOH62uyb49b0jUFDLQRWUEXS5+fGMHqBVSxpfRtVtoGB0RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430199; c=relaxed/simple;
	bh=jjBM9uBg4GNRJAA5jD9ZbVotfoOzWeYAB0imw5MTdIk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pgd0pShMVLy6GPCOnomXXNl2JCTpohurDnG2Rgnw+Md/XFD0i/eMwHCu2R1HhnyQM6cNYRA9DdAfpjLFmn0BFsOfnHBC8U3iBIfChD7XijX6Ds0uW/jsBgto5yS3LrTx9WYhH3IKWJhnTd4doduOpqUCkd+FbICz7jg2dsJYfj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=aLg8pBcH; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="aLg8pBcH"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1wh4yv-0000000G4C5-2eDy
	for sashiko-reviews@lists.linux.dev;
	Tue, 07 Jul 2026 14:32:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=WhKnRiGBppKNpN86Hrh1BNfq/F8SUBk6UDvxQS7rtwE=; t=1783427577; x=1784637177; 
	b=aLg8pBcH/ubaElT9Ww3l3gJUTIE89MNLYVbikqKUJmuypmefdqQZ9Eaf+zpbnGME/D3rf2TAhfj
	5Qr+8rPICo+R9dSrOsVAcWp7GRjaqY/ykfVALcYKUe0YUSPFr1ZGxS27/4XUY5dpFimmJ2BHDPJXU
	jU9JyQAef5wA1uhVNWSWF9X7AlL76ZOhftpubcnaXOnNNnJIkp4TuMTGKZVQJGl46Vv2Fiyc6xvzm
	tJWbmolYpWS5hwjZQ2pTKMGxzuWNBqrUtwC7j/kSJ1aCBRqiXytlww22nYoD1nxtV7OiyzcnAN+38
	rLmLL0hhODHdsqb4ZzFEvMitBZQ7b9IBV5fA==;
Date: Tue, 7 Jul 2026 14:32:54 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: sashiko-bot@kernel.org, Helge Deller <deller@gmx.de>
Cc: sashiko-reviews@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sashiko-bot@kernel.org, Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH] fb: omap2: dsi: do not copy isr table
Message-ID: <20260707143254.76bbb791@kemnade.info>
In-Reply-To: <20260702160541.340B11F000E9@smtp.kernel.org>
References: <20260702-fbomap-uaf-fix-v1-1-6417edf9d3e7@kemnade.info>
	<20260702160541.340B11F000E9@smtp.kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 02 Jul 2026 16:05:40 +0000
sashiko-bot@kernel.org wrote:

> [Severity: High]
> This isn't a bug introduced by this patch, but it appears the identical
> use-after-free vulnerability you are fixing here remains unpatched in the
> equivalent DRM driver.
> 
> Does drivers/gpu/drm/omapdrm/dss/dsi.c:omap_dsi_irq_handler() need the same
> fix? It still copies the table and drops the lock:
> 
> drivers/gpu/drm/omapdrm/dss/dsi.c:omap_dsi_irq_handler() {
>     ...
>     memcpy(&dsi->isr_tables_copy, &dsi->isr_tables, sizeof(dsi->isr_tables));
>     spin_unlock(&dsi->irq_lock);
>     dsi_handle_isrs(&dsi->isr_tables_copy, irqstatus, vcstatus, ciostatus);
>     ...
> }
> 
> This could still race with a timeout in dsi_sync_vc_vp(), which creates a
> completion on the stack:
> 
> drivers/gpu/drm/omapdrm/dss/dsi.c:dsi_sync_vc_vp() {
>     DECLARE_COMPLETION_ONSTACK(completion);
>     ...
> }

Enitities with access to cerebral richness can find the link in the patch
to the version for the drm driver.

Regards,
Andreas
