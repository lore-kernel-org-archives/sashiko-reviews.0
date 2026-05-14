Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B256309EF4
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 18:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778784392; cv=none; b=Tum0XB0R6nTgHRHeOMoonjg3MGcxjGUr5kByrr0Q/Wu6GtRB+wIV8f50V3zXj1wp+1LCz2lEVx35+7Z1Wfy5Bxn+BGbplEIDSvR6slEBXiOtSN38h0Jmd136UDfOwl5AqbFEv1geIdcADfPMjHoHQXu/uI5ihy3YWztzfHfokL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778784392; c=relaxed/simple;
	bh=ZWs/UHYsK84uYEnQZ3cF1K4U4pbiZVAZeP1d+14kwb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iSILKWiz13Xaj9QUEHwyGHxWcjulSFyaNFx01stDHHojNvMxLqR/Je7DtVtV2jJ9m5iKi+YGR8xrbpEeYsys2lfD1JQmpR3J2JLqglq4TsDBCIxvgTfogYw5iddn0X29TGPAmP+re5bIMtqx6jy+N/F965fg+OY2h5iH1DMKp4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZJfq7he4; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZJfq7he4"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ba17c8cfacso84971735ad.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 11:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778784389; x=1779389189; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mNwkE7l7eZCybJrXfUk9UXry5vm3L6Ks/wwD4RybeTU=;
        b=ZJfq7he4TvxZFARYxh1+V+J5kRMD/K9Y3YfMkugPfPVhFCtXU2MOkJt7E5af4xyLb7
         xlRzdO5DMjAMZXh3Tu3ESnwJ17WiyDxL7jNm4fJ7zMVDblkJ1WwNu5oE31vw6cCnKMy4
         vsNSI03jZRhEGrMpsrVQWZmJA2PkB1WlzEpOtCH2Uja84SvijuW3fT26DCT6mAgFAN5A
         szS9mt+Db7ucyawI2q3Rq2RbJTVMySh3cdlBoWPp91ltK0vgEraagQumjM2t69/lvH1v
         VTEHdukY1J7P2X9vUP5gw9WLhL58SKjGm/Z/7L/zmE/GAMVaO/1mON6Jvc4X+/O/4Mig
         HoXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778784389; x=1779389189;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mNwkE7l7eZCybJrXfUk9UXry5vm3L6Ks/wwD4RybeTU=;
        b=fPNlSLHXeItjPucskNxIv6oozmWW2bXV8GpyhgfFrvXo8/KcYCTYVsn/rHiERbw0cT
         S0U4zjOR7TWJGLNHyeRNF7QnkBVkICHnvrphtYcH307H7I2C2M/Yr7hIKANK/dJsA5W7
         spMkYfcx/j0InugKeLYK/0CjcFvSIaxhDmgkXuiAm0Y4oewTFBF476DaHl+9H9ezgaeA
         iVI/S5DalvYqz3zrnGpdfSfCv/t/p4vd2JcMKLLWf8Cr16PSRtK7VGdiRyKkRsCL8LxU
         NoRpUelxCi2661jrqTahNNf9AoBjEUa/kkNDgOUI0vCDjo2G5IYkVEltdy2JUnCP3Iwq
         h9Mg==
X-Gm-Message-State: AOJu0YwYQFXXr7+bLPEv5TUcfK1VRACgA8Nn0YZoXZwIfFYJo1nECLSk
	EsVk1ecPRb4NJMw8IURgj/NpONj8Ew4YQ5HbYIFJweqykAfM2Pcufv3G1Dxao+ICC8HTQRGzVVf
	rxlHTEg==
X-Gm-Gg: Acq92OHHStn0T+D0JREHR4DBKWtK7VrFLNEfzN2LkhJdi7NboOj1r1KR9uEra6BAF+x
	Dc9NsTWY7CnNSDM9qbERt/4aJPkG8jGGEz6Y/J0V9S1NZVjV+ZX7XkbDip7PV9OgFzQeN3szgiV
	ukUJ2ilxwPhLLmqrajbn5+9hEj5Fjyg3tZtC5nEgyZp7vRZ4ejOjxV3hdFNUwV+000G2cTOnaeV
	VZ3ys4kL24k48eJY/zYbyDoo+SAJ4howbK6Mf+F9Y2Ej0pvhHLda1STWVHAzfN3m0Y1sZpF4hu6
	V2FrPT/rPYmS+1xuh6wum1nr5JciyWySE1Rl0Z1PMi18YZF0BCvxDsUQeOo2AiNFkk1w6TlxZi0
	PCitCUCM9d81KoYvHfcgSLVqhKKannNFgYbIRbOlXvh42IQ4h0rMzYYhmM9E+v26qyeQHd5pzHp
	ZBRHKJS4AgW1zHwPbV/AWQJMKULe8u5ylVgtXcuw0b2h+M+SDnLbZsiwuOeOmMnadIMsJO+wCb
X-Received: by 2002:a17:902:c948:b0:2b2:4f43:b48c with SMTP id d9443c01a7336-2bd7e8423a7mr7937695ad.14.1778784388674;
        Thu, 14 May 2026 11:46:28 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe49a4sm29394575ad.38.2026.05.14.11.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 11:46:28 -0700 (PDT)
Date: Thu, 14 May 2026 18:46:25 +0000
From: David Matlack <dmatlack@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org
Subject: Re: [PATCH v5 07/11] PCI: liveupdate: Inherit ACS flags in incoming
 preserved devices
Message-ID: <agYYgQc-gjs7-III@google.com>
References: <20260512184846.119396-8-dmatlack@google.com>
 <20260514023718.1A7A4C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260514023718.1A7A4C19425@smtp.kernel.org>

On 2026-05-14 02:37 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Modifying pci_dev state while holding only a read lock in pci_liveupdate_init_acs().
> - [High] Intel SPT PCH root ports bypass the ACS quirk rejection check, causing their custom ACS control registers to be permanently lost on the new kernel.
> --
> 
> commit 9befbb904977419650ee202e0854fc1452e0a9de
> Author: David Matlack <dmatlack@google.com>
> 
> PCI: liveupdate: Inherit ACS flags in incoming preserved devices
> 
> This commit updates the live update process to inherit Access Control
> Services (ACS) flags on incoming preserved devices. It caches the
> inherited ACS controls established by the previous kernel so they do
> not change after a reset.
> 
> > diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
> > index d8e06afde2c76..e3cd6d76636c3 100644
> > --- a/drivers/pci/liveupdate.c
> > +++ b/drivers/pci/liveupdate.c
> [ ... ]
> > @@ -361,6 +373,16 @@ static int pci_liveupdate_preserve_device_new(struct pci_ser *ser, struct pci_de
> >  {
> >  	int i;
> >  
> > +	/*
> > +	 * Do not preserve a devices that rely on device-specific ACS
> > +	 * equivalents (for now) since that would complicate keeping ACS
> > +	 * flags constant across Live Update.
> > +	 */
> > +	if (dev->dev_flags & PCI_DEV_FLAGS_ACS_ENABLED_QUIRK) {
> > +		pci_warn(dev, "Refusing to preserve device that relies on ACS quirks\n");
> > +		return -EINVAL;
> > +	}
> 
> Can Intel SPT PCH root ports bypass this check?
> 
> Looking at pci_quirk_enable_intel_spt_pch_acs(), it does not appear to set
> the PCI_DEV_FLAGS_ACS_ENABLED_QUIRK flag.
> 
> If these ports bypass the check and are preserved, pci_liveupdate_init_acs()
> will only cache the standard PCI_ACS_CTRL register, ignoring the
> device-specific INTEL_SPT_ACS_CTRL register.
> 
> When the new kernel calls pci_enable_acs(), pci_liveupdate_inherit_acs()
> will restore the standard register and return true, skipping the
> pci_dev_specific_enable_acs() path entirely.
> 
> Will this cause a regression where the custom ACS configuration is lost?

Yes looks like it, I will account for Intel SPT PCH root ports in v6.

> 
> [ ... ]
> > @@ -671,6 +694,32 @@ void pci_liveupdate_finish(struct pci_dev *dev)
> >  }
> >  EXPORT_SYMBOL_GPL(pci_liveupdate_finish);
> >  
> > +void pci_liveupdate_init_acs(struct pci_dev *dev)
> > +{
> > +	guard(read_lock)(&dev->liveupdate.lock);
> > +
> > +	if (!dev->acs_cap || !dev->liveupdate.incoming)
> > +		return;
> > +
> > +	pci_read_config_word(dev, dev->acs_cap + PCI_ACS_CTRL, &dev->liveupdate.acs_ctrl);
> > +}
> 
> Does this mutate dev->liveupdate.acs_ctrl while holding a read lock?
> 
> Since pci_read_config_word() writes the read value into the acs_ctrl
> pointer, should this use write_lock to avoid a data race regression?

Yes, will fix.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260512184846.119396-1-dmatlack@google.com?part=7
