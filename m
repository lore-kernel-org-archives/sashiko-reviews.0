Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB0238B140
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 18:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785348405; cv=none; b=HPMFrO++Ex/DV5je/qMu3dcv6GJUlwcOo1yS57Vo0QJpucPNlmDKxkGGhrDDN4ZGwxY/hZiURct1WYwu525GJnbVTTYW8hRAC0Cm/dxXmsHvFnT+nZP9HHiI+8FTuOkcaCSwNpYGdZj1FNKnjZpylra/7qa0IQLXGf14pnjy0Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785348405; c=relaxed/simple;
	bh=awd77f5bif/dIgyPxCs6KSL0oviQPYlUuXl3UA5EPtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FMichkz7Ki3f3bZIWdyYJKywg7QLJBMT8NjHlw9uBhKHriGxP+G7i4u1CUoDlRShifFL4CHxE3vIhx2fq4VIqPp7JfK0XdruqgkHf411tGuldIIgcAQyT0hzZ9XeH3LrISDXGNN0IjK7nhrCVVbeqyMYyhe9igm1Uw5Do8ndE/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PjpWGm+t; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PjpWGm+t"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4728c12ba97so868204f8f.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 11:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785348394; x=1785953194; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+yaJ1hCjUBCmis82b4ussWNf6EXlhg+aBQ8DtTvotq0=;
        b=PjpWGm+t9FBo5o2OVyKjLVs7HRXNB/2qvvF2WJ+vwfNgOexAlXjxSenWpYsM9g3+Pr
         4xH29UIpXvyiBMudOYQmCXjqe/rTSzj5tswOsT6sAsRm06abcgGcViwMxoJSbIRfw6iH
         E5tNJZImy0HQ3t3ZIPtmR6FRu+Khe9wMUiY+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785348394; x=1785953194;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+yaJ1hCjUBCmis82b4ussWNf6EXlhg+aBQ8DtTvotq0=;
        b=mtE7qCbRh3IEbSROcE0X7xIYHtIHQ4v8R+EYP1IB3oS8rF6tVv1EeD/kYij+blLJ/F
         6Xn6hK/gS0EfkHN/hw7ka9tFTsqhu6vVLfqGAnNksGwkuMvRBtnuIdZX7x/zIty7m+RV
         rW//2/q3LVcutNpKqdog+MpTcUzXh0unG00/zXBVNWn5Qv3yy2VJjpDO3ChprEtJNRE5
         FI7aOyu8aqbaTbaSeJR+i24kxYdc1fuIjodcmS2Qmzf2SeHOeRM/C0Tjjixs8ZPq4pik
         bVX09qsDCQzKlxPmPxGGlMjFOHP9vWO3SgVu/Qgl595CXN4bRU3/NuajZeB/A9V6f89a
         6Tzg==
X-Gm-Message-State: AOJu0YxMQchgC6DZ+tfrjK3NQtaBEw4j3iUCi5cxI4DcS6b/+9TefvfK
	PCusGDOWLdQxG2MjEIlSNyz1wD9vFccgZTrbytyVEA8dCg05/r5G6wldwt+V0I512mIqncQmaa5
	+yavkBw==
X-Gm-Gg: AR+sD11yIKZV/i3abYK9BV07mle/cCYapoFYc35vp+/XfGUXOI+ZDtBd4/GxxMTAilU
	ICzpInSZf2YOvfcnb1d8opejFXtt7y92N5GNY3bk+yocvCpnicUuUzo149qphATQUD81pBudFla
	8CMNtV5AK9qEAO66w2ImYBWaqqmxSEjMqjUZ9ijJRZ9ixJLcB7A9USs4LNfO8nuVnLvin2BsKbB
	RtAj+SiwaL/Ly7iyOdY8MKvAcTNpHrvK8HO2qB3hSgIQUvZ465G3SXyJjowAZGc+P/kUEGuimeb
	nxKo1wnRgbu/iaqr7IZJEAT6XIosq0HbkuOdoGPQSHz37krB3zSLLLkOV1oDaUw2MGRlIWmx5yn
	iOls4OScV3nXH/R5K40mt/pJtrLQ+jprsyg6NKN6B1tfWhIml0Toc1wq77XDwTt3VOTMvQA+Ujr
	T+LuDl4ZtspQbDTwFyb+/QVPVVChZ5A569Tqwr4BhuPkpnx/0pLURwAEzert0DHiSrcPerX0H0H
	mhRpfI5WaZ/6yF6kgUX2w==
X-Received: by 2002:a05:6000:430c:b0:47f:9201:6409 with SMTP id ffacd0b85a97d-47fb1f17008mr8860822f8f.40.1785348394087;
        Wed, 29 Jul 2026 11:06:34 -0700 (PDT)
Received: from google.com ([2a00:79e0:285b:8:6f8:f7bd:339a:29ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b0f039sm10526768f8f.18.2026.07.29.11.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 11:06:33 -0700 (PDT)
Date: Wed, 29 Jul 2026 20:06:30 +0200
From: Dmytro Maluka <dmaluka@chromium.org>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] KVM: VMX: Fix stale PID-pointer table entry left
 after vCPU free
Message-ID: <ampBJrSSas_XISim@google.com>
References: <20260729170621.308809-1-dmaluka@chromium.org>
 <20260729170621.308809-3-dmaluka@chromium.org>
 <20260729172831.5BDE71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260729172831.5BDE71F00A3A@smtp.kernel.org>

On Wed, Jul 29, 2026 at 05:28:30PM +0000, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> > index 6b96f7aea20bd..ebf26ea84a50b 100644
> > --- a/arch/x86/kvm/vmx/vmx.c
> > +++ b/arch/x86/kvm/vmx/vmx.c
> > @@ -7572,6 +7572,9 @@ void vmx_vcpu_free(struct kvm_vcpu *vcpu)
> >  	nested_vmx_free_vcpu(vcpu);
> >  	free_loaded_vmcs(vmx->loaded_vmcs);
> >  	free_page((unsigned long)vmx->ve_info);
> > +
> > +	if (vmx_can_use_ipiv(vcpu))
> > +		WRITE_ONCE(to_kvm_vmx(vcpu->kvm)->pid_table[vcpu->vcpu_id], 0);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does clearing the pid_table
> entry alone prevent hardware from writing to the freed pi_desc?
> 
> According to the Intel SDM (Section 29.1.5), the processor caches PID-pointer
> table entries in the VPID.

I can't find this statement in the SDM, and I'm not sure what it has to
do with VPID, apart from the acronym similarity.

> Because KVM immediately frees the vcpu memory into kvm_vcpu_cache after
> kvm_arch_vcpu_destroy() without issuing a cross-vCPU flush (e.g., via
> kvm_make_all_cpus_request(kvm, KVM_REQ_TLB_FLUSH)) to invalidate the VPID
> caches of other running vCPUs and synchronize with in-flight IPI deliveries,
> can other vCPUs still send hardware IPIs using the cached pi_desc pointer?
> 
> Could this result in the IPI hardware writing to the freed vcpu memory and
> corrupting another newly created vCPU when the memory is reused from
> kvm_vcpu_cache?
> 
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260729170621.308809-1-dmaluka@chromium.org?part=2
