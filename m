Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FDA42E41B
	for <sashiko-reviews@lists.linux.dev>; Mon,  5 Oct 2026 22:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791239482; cv=none; b=TO0BeFXsIbzg/WB8rkdoyGqVQQarnHT5q7LHLOrUjJyurSHdczgIu/lfR7WXffRWB/6K1COkaIMMZfgFmxn4mFqgzNCDbb/+uXI9Yhza7FlmaG94cD2XL0nfv7D6zBEy8v6HYRQEpY5eV/A/ZAHPbVjEt+Xx+XVBL30iS3pM2Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791239482; c=relaxed/simple;
	bh=fJsx0uA6khk1HRvoK9tFCr7F6Fo9cbBNyW26zVd3mog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ugj9o2m/y4f/KWhw0K8iyVBTdMRyNX/efjlthpRbc6FDmwKeqYD57UocvvmEA918iRRXVSjMwbdVbxOySeu/ehv3loNxeoiWvwWWxacWThPNm6NiNgMH0I/YtX3wPsIEw86pa7nH0uZr8BRgTkqsR7eKTebrGnl2tlHSjer7mY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZZgQJ4L2; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZZgQJ4L2"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so12685ad.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 05 Oct 2026 15:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791239480; x=1791844280; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oiSimi82Dk/ZGnkJeyaCV/mnPB9bT0XsGcAfkBTe7Ms=;
        b=ZZgQJ4L2KYd0DWjnv4/KYkNrKl2xwMuCy8n7AKQefJsvGe9fbXJDJzEEnEJbYJPLEm
         wm+MEm2hxVlPsYLn4Rqe2t1Q/DaQmxlnV71PLYfIFWXwFgVJ9Em7YveYLDOBPJu9MfBO
         xfpGunN+1U13vlyaxoqk/ptwBOKOQa8sN9MMQHlyE4eD9QewzvSz+kOa9P7rrHtrSNYX
         lSI+/L7jjlDLKASMmcjOb1V0ihKyonp/90EyErsMJO6AYZmqr8qhJx5urGrh0OiCwqlS
         JYyHB+2NoMcTR+pXzP4xy5qr2XspwnhEgOC+DfawkMf40e0I/t4oaHkE346E/xFRCURr
         64Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791239480; x=1791844280;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oiSimi82Dk/ZGnkJeyaCV/mnPB9bT0XsGcAfkBTe7Ms=;
        b=rIRXqla+dwoh5hu0Vh0bydOTTWiTOQESOdSQnvq7codqI+o9fzexf7OGsqO++zvYIL
         /51e07/gt0QicU9jIAd156KeaDs1LhbBDuIj7kVUSnWRAnCCGRRDyajiiTJdAotjsDaF
         d2ihCGRhwyz5nMaWhoo8mtS5J504olTrFc4uXvEPetFZ9ZWoFG/oVbsntJY6waDmMnY6
         L7urcolLsRIXpWb+ZYAmSLg1d8bvI8Mt32+8gS6UPbjZRdD5w5f9fvsAWOntRlmSwM34
         Gk/AlcnLgXByGJeX1QYoKJXsO+HkWqu5unlq7mexpQ0zBo1ECnLYSFD+7WF/Jkn4dvil
         Km4g==
X-Gm-Message-State: AFq9FYKQ6X+xdFsHayFhvkyrVhOVCV7b6ddVejwLt5IZzsqAhE6NIYpD
	6vA5k96C1l3uIDIADXLOHRh5PqR5AWojMjHNClVBtU+0QDTcJLZkiutuCI2ox8+bnzolQdEnu4C
	wnVZjOw==
X-Gm-Gg: AYBFou3mthegP55XJGjAtXDoAtO2R9BnpZCCpx1EWB5cBu59+J7mgeQP13dlISxN34X
	9HCGSmIuvpCkZqvOsAlClTmCixN/KDwmZFvxExIsdzXSPMjCiqXG5ah5nbrJG97UC0kfqVFcjrP
	3oSdaBv6N7o/Ve/dAUSPgwh1lCuRpEr/y25tNhQd79qp9ya41NWole+jjUMS2Bx73qOQyRhmqY9
	iPWOK+6AKuRICnPtRyoGwGj9HXx4UlPFkxcCCJqItO0hJ1J+L3o2XcEHjJSlgVvJ++5Hxnx1+Xj
	S9fmZnfNTj6huLVDOuV4JgrCv9miJbOdXMUYm2OESG073u58eGdwVM6w6447JCZhgte+tvIH8tr
	qodfeOouP8eYCcZsVBasvE5JOQLdT2TqtII02/frC0NehDU5kDP+Omvn7uXF+MynUy+RUBVyKWy
	MRCRF/LligGUi9QagY9hRJu8J+AHLT0Z/5dj3w0U+pA8W+fGG1UGMzKmViodhgk60B6zGPFloMu
	5nHRxmaoKzW/BYWyYzRaDSCX9qjqFlpOMr8g01Ryz4=
X-Received: by 2002:a17:903:3c4c:b0:2d5:c090:3810 with SMTP id d9443c01a7336-2e5c9fc1f6emr2100015ad.2.1791239478925;
        Mon, 05 Oct 2026 15:31:18 -0700 (PDT)
Received: from google.com (230.0.127.34.bc.googleusercontent.com. [34.127.0.230])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d9f86aesm1455404a12.18.2026.10.05.15.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:31:17 -0700 (PDT)
Date: Mon, 5 Oct 2026 22:31:06 +0000
From: Lisa Wang <wyihan@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Subject: Re: [PATCH v15 07/23] KVM: selftests: Add TDX boot code
Message-ID: <asQlKs3pxOjhLUp1@google.com>
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
 <20261001-tdx-selftests-v15-7-7c62a5d8a992@google.com>
 <20261002091330.4B5D31F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261002091330.4B5D31F00899@smtp.kernel.org>

On Fri, Oct 02, 2026 at 09:13:29AM +0000, sashiko-bot@kernel.org wrote:
> [ ... ]
> 
> > +	/*
> > +	 * Find the address of struct td_per_vcpu_parameters for this
> > +	 * vCPU based on esi (TDX spec: initialized with vCPU id). Put
> > +	 * struct address into eax for indirect addressing.
> > +	 */
> > +	movl $SIZEOF_TD_PER_VCPU_PARAMETERS, %eax
> > +	mul %esi
> 
> [Severity: Medium]
> Is it correct to read the vCPU index from %esi in td_boot here?
> 
> According to the TDX architecture specification (via TDH.VP.INIT), the vCPU
> index is initialized in the %ecx register, while %esi is initialized to 0.
> 
> If %esi is used, will all vCPUs evaluate to index 0, causing them to
> incorrectly share the same stack and guest code pointer? This seems like it
> could corrupt the SMP stack and fail multi-vCPU tests.

According to the TDX spec, %esi is the vCPU index.

> [ ... ]
> 
> > +	/*
> > +	 * Set up control registers (x86 does not support moving memory
> > +	 * directly to a control register).
> > +	 */
> > +	movl TD_BOOT_PARAMETERS_CR4(%ebx), %edi
> > +	movl %edi, %cr4
> > +	movl TD_BOOT_PARAMETERS_CR3(%ebx), %edi
> > +	movl %edi, %cr3
> > +	movl TD_BOOT_PARAMETERS_CR0(%ebx), %edi
> > +	movl %edi, %cr0
> > +
> > +	/* Switching to 64bit mode after ljmp and then jump to guest code */
> > +	ljmp $(KERNEL_CS),$1f
> 
> [Severity: Medium]
> Does td_boot miss a wrmsr to set EFER.LME before enabling paging?
> 
> The TDX VM guest boot code enables paging (CR0.PG) and physical address
> extensions (CR4.PAE) here, but appears to omit writing the EFER MSR to set
> the Long Mode Enable (LME) bit.
> 
> According to the x86 architecture, enabling paging without setting EFER.LME
> puts the processor into 32-bit PAE paging mode instead of 64-bit IA-32e
> mode.
> 
> Will the subsequent far jump attempt to load a 64-bit code segment
> (KERNEL_CS has L=1), causing a #GP fault since it is invalid in 32-bit mode?
> It seems this might crash the guest VM unconditionally on every boot.

In TDX, TDH.VP.INIT initializes EFER.LME = 1 already.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com?part=7
