Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83702396579
	for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 09:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875843; cv=none; b=ryX0BY2kMZZh6yx6bScI+K9AOB9zqLT2pOFZbtx07caYb8+c0oft1fFPiM+UjB1BRImi+EmgV02B5yfvTuJ3YBzSi0Kf+rWS3qJVHuTWwchVa5xqpiKh9z0RjHYhWn1E2oe9P709gh06cXNR4G9i8wzLmmlnHBIZT4AfNxe288E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875843; c=relaxed/simple;
	bh=++tgT2Sz0TpWfiXXAm/QF+e/DOGLWBskiZrFnEqVsSE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tOFMBCnAp7QHeWPB/uMN2cMtn3GpSTAFT0mgScNIv7FBMW9/XcEnr5/jwmGZjticufoYfZslKH2Fp2sMz+kn/AgYDEaxDdcge6Tce3onNiH1GomiQBxVwxy7+hGcR8i2IF6kApPHie1C+1VM7969+kfAjVLsgM5CsYhYijpuxjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NlfcMHxp; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NlfcMHxp"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ea19f412aso3626580f8f.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 02:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779875840; x=1780480640; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FC7ZL5PTAZWI+jfnZHPihHv7ZDUJ8Gkzr3+eQaCgs2w=;
        b=NlfcMHxpQ9eRZNTSv5YtQegiclPvi6Fmpg9UrjbUm50Z0mbIfsCFNjmMepKaIC0xGZ
         bVazgWz+pA2bi53MMDSXnPFTOf8fX2WVFo2GTL5SYoYwGspbwMmYhABX9dKpE9m5aL19
         0K3C7ypjsSll+i/UfavyhZPDGh4vs473JciEtM2VG1rQAxT87v1A32e1GqLgl8FGz02F
         tsH75IvaOq15OTJwTm6KQyGz+jznFiPoabI8wuWM8smnk7TD8GSaE52eDa/d5Wygaee9
         mgDJTqsjn/rCZEomYlqeYL/Rs5ZT0RBoEDosMXhzOZx8UeuGul/FDiPs6cqa79UgOCbs
         PMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875840; x=1780480640;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FC7ZL5PTAZWI+jfnZHPihHv7ZDUJ8Gkzr3+eQaCgs2w=;
        b=NHX4ukbBljH59fW+icDXhTxtKWzSATqXujvHDs2DTbNNjG7t4AohiFbJoj9BPq3Qa8
         kM7/sO9QTuTf7ecDVaYAGIsIV7hRU/IN30771FmEMjHiWv5E6ay0sNpej1LaD/+fDIz2
         fvyQ7dm6U0jHGb4o/pSzEkbTDhhARJ6UOO2o56ejZyX0/blifFxTaKp/L2NDT4vdZBJQ
         XGsEnDHz8X1SA4HytXS+733qxGxkHjqjy1yrfJYZLxU1ceA6RUJ/t63eLOxJBOzd+naR
         K1LTKhW5ZZser5+CqfzELmbO5EMFd2XFNtA4pMKyvHF3aRF7VFUqqjwqA6gH8ZU3OynX
         WBVw==
X-Gm-Message-State: AOJu0YyqP736BFoP9sfvJbn/jgKpQbT+x/u5nQvE+vMU7y6Dt6+jRX9Y
	nv3h0op5OpXyWEQ4DzhqjrCAoF0YZA4DJI35s1ka54NJbpHnkh04YNi+V5tTYg==
X-Gm-Gg: Acq92OFD874k4kNre8FIxBsd/CIPyA4tVpMmp/WKly5PfArkJsPZ1LJj2s7YW+A3c0u
	l9ljEuuavBUe05Na8hjf58GUl0I6/LSW3Nm91ffrzFLKvFNlUyZuO9niIWJNbkah1RgOcVlDzLj
	nr9hhAB/X3TKWRuErIH5i7hHYVkwElco+gCQz43tClA/yk1KN8nOo5U5n9QJ0wQ/cMuvbbXqLCo
	xrX63urn7whPtLeML8t8FEWo9n5PB6/j9/W8YlA/Wo/QxFvoi5ewAeGll7nvySCZTTL6tTFX/TH
	/SkIERbDTvGm64muxki7lc2SaFRZ7mHMN046vcqKjmhib70yd8O6G5G3jALx4O57ttfZ0Db3gqM
	K+1hbalpcfWuAnhKPHjLEV0VA6JX967exjBVDWYO0LJWLL/d5TJsjZe9H6y8fhY//XDi6iaj4+N
	/ObSaksdglbelzpMkqXPd6b2PAOw==
X-Received: by 2002:a5d:64e4:0:b0:45e:779a:302c with SMTP id ffacd0b85a97d-45eb38d297amr39611266f8f.29.1779875839707;
        Wed, 27 May 2026 02:57:19 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb4bae01sm4843151f8f.0.2026.05.27.02.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:57:19 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 27 May 2026 11:57:17 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv4 06/13] libbpf: Change has_nop_combo to work on top of
 nop10
Message-ID: <aha__UZNxWCT2ZFj@krava>
References: <20260526205840.173790-7-jolsa@kernel.org>
 <20260526212840.1053C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260526212840.1053C1F000E9@smtp.kernel.org>

On Tue, May 26, 2026 at 09:28:39PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The patch invalidly replaces `nop5` optimization support with `nop10`, which cannot be optimized by the kernel, breaks backward compatibility for existing binaries, and causes selftest failures.
> --
> 
> commit df13b5dc7675e7ea56d8d1775d22295b93e92ab0
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> libbpf: Change has_nop_combo to work on top of nop10
> 
> This commit updates the USDT nop combo detection to expect a 10-byte nop
> instead of a 5-byte nop. It updates has_nop_combo() to match the new byte
> sequence.
> 
> > diff --git a/tools/lib/bpf/usdt.c b/tools/lib/bpf/usdt.c
> > index e3710933fd52a..484a4354e82ba 100644
> > --- a/tools/lib/bpf/usdt.c
> > +++ b/tools/lib/bpf/usdt.c
> [ ... ]
> > @@ -596,14 +596,14 @@ static int parse_usdt_spec(struct usdt_spec *spec, const struct usdt_note *note,
> >  #if defined(__x86_64__)
> >  static bool has_nop_combo(int fd, long off)
> >  {
> > -	unsigned char nop_combo[6] = {
> > -		0x90, 0x0f, 0x1f, 0x44, 0x00, 0x00 /* nop,nop5 */
> > +	unsigned char nop_combo[11] = {
> > +		0x90, 0x66, 0x2e, 0x0f, 0x1f, 0x84, 0x00, 0x00, 0x00, 0x00, 0x00,
> >  	};
> > -	unsigned char buf[6];
> > +	unsigned char buf[11];
> >  
> > -	if (pread(fd, buf, 6, off) != 6)
> > +	if (pread(fd, buf, 11, off) != 11)
> >  		return false;
> > -	return memcmp(buf, nop_combo, 6) == 0;
> > +	return memcmp(buf, nop_combo, 11) == 0;
> >  }
> 
> [Severity: High]
> Does replacing the 5-byte nop detection with a 10-byte nop detection break the
> kernel's uprobe optimization logic?
> 
> Looking at the kernel's can_optimize() in arch/x86/kernel/uprobes.c, it
> strictly requires the replaced instruction to be exactly 5 bytes. A 10-byte
> instruction fails this length check, causing the kernel to silently abort
> optimization and fall back to an unoptimized int3 probe.

this seems wrong, the related kernel change is part of the patchset

jirka

> 
> Additionally, replacing this entirely rather than supplementing it means
> libbpf no longer recognizes the nop5 combo in existing binaries. This causes
> existing USDTs to fall back to unoptimized probes and breaks BPF selftests
> that expect the +1 offset applied.
> 
> Finally, if the kernel ever updated can_optimize() to allow 10-byte nops,
> sys_uprobe() currently hardcodes a return adjustment of regs->ip += 5.
> Returning +5 bytes into a 10-byte instruction would resume execution in the
> middle of the nop sequence, which could cause an application crash.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260526205840.173790-7-jolsa@kernel.org?part=1
