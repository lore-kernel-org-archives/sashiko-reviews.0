Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEACE364941
	for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 21:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787950949; cv=none; b=UDuEnmomNDm8tJ6QyKDdDZmQ5E57aZxu/Q6LwfyNhAwY18N+49i8cniXqdLEVvb7sj4wLVOiCG7/a/euzxp/wYESxPqURlz4BnNPX3hxhvb/aQ/1jBe0X3ggFWZmelLwE23YvboxhcKcszIesdavXLolyjePzHOaUsU9HBBPcAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787950949; c=relaxed/simple;
	bh=EBbufZZ+sAD2y0V21+jCB7JK65ijPEhb88MVaJjhjEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lPF83SbFHCCDQWjuuhm+0YDva6nj0Qi2o/3XEc+0OU8umjvVWjQiUTO2IfCJZus7sEyYD/lp3fMAL0qNPHeVsv5UihpRh+Xp35xJKzFs/ZbpKCJDipnZYWGZA/MsP7z2uPkVfMlvKTVbx/RFLVJuARtZAodHXa9M9ZXmGJMSdFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=IdcQsXYv; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="IdcQsXYv"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7ee37dc91f5so857270a34.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 28 Aug 2026 14:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1787950946; x=1788555746; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EBbufZZ+sAD2y0V21+jCB7JK65ijPEhb88MVaJjhjEc=;
        b=IdcQsXYvMFX+Q+Oby/rd7TnQ37qoJ+gWJqyb603CAk5ljEUjcUJEDXIjDPGEcr5lNm
         fsnf0DqOOVA+DdJhg8rwV9Jdu3R+MAw5C4QwYURatO1nhVUfM0nWHJifWofyWhdyApQY
         JVxKgcE3luIOm9IorvwVCwNAnsbjilVDNpRjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787950946; x=1788555746;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EBbufZZ+sAD2y0V21+jCB7JK65ijPEhb88MVaJjhjEc=;
        b=TbnQV4nzQ/vQhB1YflYQ1b6A1zUdn5Nx+gimOPtp/B6l2qtyyGxrlg1m4i8HrFnVwf
         OVsGKc4g6ADQxCTSeFnzk+t2mRl5xZljqa5DDd606rlztfYqndPHvqBkVsjpFVGmZZhk
         rqc+49cfuCXYmirJQrWzJ3wruseWcX6aFxqgkGN+Z/5CMXlwAaAsP3pffs/apszUjJJH
         4OEc0sSnRQmS3XKQa8afqHjso+tYkup0o805SBmFHbC4O+y+nPvBgIiawKByDWVTdSDq
         6a6ochVlWgc9sDu8t72tKBPaonajZHuyRzlpAjsVShuApM8HUW+VWVelHJg1KSUtJbgv
         dijQ==
X-Gm-Message-State: AFuF++lNhkBbh8QQfhMAdP9sHuoRe+hV4TA0/TEZoiXVxP/E55yuYgv3
	i7Uyf0uszC7FObzoyMm174yUFFh7EMeruo2L1pr2Dlh+m3mYZW3rgyXLjRexkys91Pkat5yC+6w
	sw2wueY8=
X-Gm-Gg: AR+sD13KlGjAY65NT8XH05rF4CFDfRyayiRnKwbboN8FOcsPVX6RZKTad01yFQVY3sK
	6yLJbeClWGUR2VqWFqC2lQNz3/3sx+jYxXOWTR3jjPeD0fw+bzTCj/+fJ8m/fGcWVfXNuMJjVyo
	ezHnRWpyBCOcd833X/wFXuxSWBbxPDCLuAMjvdbu5udIZ1tJOaw7IAJ+fciX/qnwaIW2eKao2mu
	VXWwpNvgH+GYMvPU0uTmRmR6LwV/fFzbHKKuGSZ9e/Rm02QoA3UVwHEkmN4Rpe4F+rU+rYessDU
	lHEFmRC8dorRgmNBodcTol+5BCPm4rEG8adBp2QjNj3WcJ5g9Q5mj3E1Ht1SWL0boxMcILxvJzh
	gVuF80Zz3k046iNwlvrWyMTCbDBm//fkkUEif1KqWb7qktlaWuBxtEQEZPks2iPHNFvFzBJtpox
	r9FmAPrikTmA5mrqEteKr2pmAai2fMq8WkUXGuOX8XWR2bGLqqpYmpWNtOMjcINqp4NNL10L5lm
	YhV0yUmGwdMgyRf0IfNgQMNjmMlsTWdACE0sWAILmA=
X-Received: by 2002:a05:6820:180d:b0:6b0:589e:42f4 with SMTP id 006d021491bc7-6b1c66b745cmr9469438eaf.20.1787950945751;
        Fri, 28 Aug 2026 14:02:25 -0700 (PDT)
Received: from com-75606 ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1ce14f77bsm2321969eaf.7.2026.08.28.14.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 14:02:25 -0700 (PDT)
Date: Fri, 28 Aug 2026 14:02:21 -0700
From: Kyle Zeng <kylebot@openai.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Subject: Re: [PATCH] KVM: x86: Restrict saved GPA writes to hardware write
 faults
Message-ID: <apH3XVa_uzt2ieGa@com-75606>
References: <20260828193055.59623-1-kylebot@openai.com>
 <20260828194912.E4DCC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20260828194912.E4DCC1F000E9@smtp.kernel.org>

> the hardware does not set PFERR_GUEST_FINAL_MASK
> (as this bit requires GMET or SEV-ES).

Is that requirement documented somewhere? AFAICT, these are ordinary NPF
bits. Bit 32 identifies a fault on the final GPA, and bit 33 identifies
a fault during a guest page-table walk. Both are already described in the
Current AMD manual
(https://kib.kiev.ua/x86docs/AMD/AMD64/24593_APM_v2-r3.44.pdf)

KVM also started preserving these hardware-provided bits in
5e3525195196 ("KVM: nSVM: propagate the NPF EXITINFO to the guest")
back in 2014. See the original patch (https://lkml.iu.edu/1409.0/01003.html).

If a CPU really doesn't set FINAL for a final-GPA write fault, then yes,
falling back to a software walk would be a problem for SEV. I haven't
tested this on Naples or Rome, though. Is there a known erratum, or an
actual EXITINFO1 value showing this on either CPU?

Thanks,
Kyle
