Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D752C3E2AB6
	for <sashiko-reviews@lists.linux.dev>; Mon,  5 Oct 2026 21:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791235617; cv=none; b=lqbXDrtNp2uyZ42YB9eleIaBuA/Ti4dF9PcgMX5/3sWR18MQI+vPbz1/ST/XaAHLqVhX6c+k5waMh2bqZh8Ci95+hAEe75Lk3lVwa/wZPdqkMt0eeAXDFqKv71Q+pCUxUiyQM4D+DPCa/1aFn/ItAigt5pO0CxNXcyS6lV+Dvwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791235617; c=relaxed/simple;
	bh=dViAwycqlhC94szZBFseDic4iSpt+fVVDuPkQGr//aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3BumkZjN0jUYAJZdxLt8d6elIZtML1o6dfjI2anFn5e6HNGAtMRXYrZqwAsHn2AhuCbcTsLCsUWO8oxWAGhrL3u24tMPohB0ORL/t/pfXlDUGxQj240XuidliNIRew9yqEuCWfu5UMz7oI/w0hz4oKNThKMzXX4lcZ39P+D9bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DwtQJcWJ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DwtQJcWJ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2db33db4de9so19865ad.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 05 Oct 2026 14:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791235615; x=1791840415; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0delO3SDUwNPg2/XER4kYXkLDt9VJFcjmgwYxx8hZ4s=;
        b=DwtQJcWJeO+zlq0w6z/J5Aic1cE5YWa8bK320a7/V1kZsaQZjXhHUKfNnNlumTQMjV
         0hwjeqYtvH7rmB74Le+KMyA8fz74pimwWBk6CK2/0ivmJviKefBcexAtLe4PowYG8lZ9
         hnBEw0y2SO+fJVJ3Hs6ikg8enJ92cYScxnyO36Rey/v9Z5O36pWnOuDkKQUkvV1O5NhJ
         8zQBci5EVkLm8j0IRx6EeUDx67+VxbQtBy4g1FEzCmOFAqVnNGpS8dpeXpkd6CLhpkUm
         K/Y9AsMEURc0oATn7gGy/3dNV5wSeU1Ipq0jOvfKJefIscz19zp7nz7hfweA+UCOLpcZ
         JoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791235615; x=1791840415;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0delO3SDUwNPg2/XER4kYXkLDt9VJFcjmgwYxx8hZ4s=;
        b=I1gkT087Ce35bN1FRoj4sElOTe/fetmVCbq0B7hynVpiNOEjDUqtUEXzjMMSuue9OK
         LFTnQ+bTvsnRTXZCz0CR4r5j2TmQEFMA9Mjw+9u862Vo9C9LxHKhJC4rResnZuf1pNm3
         YlmmAwW126kc7Yvtc9ZhigfIph5hoiRb0NR9EVSharpe7MarfNN95yWWhM0xlyqQlcRh
         NzvosCXbrJTA1iTz3nYX15uF27ekVphgWXQS7YF5pOlrtA/SYDYpkMork5AIhDx2Yry3
         yBTRuaY/cBj/d73z+E6ysaFpcGg4Nt3U7jq1IXVqSThUvC2IyyK1eHkSd73xloE3pClo
         rBgA==
X-Gm-Message-State: AFq9FYIlKcATR80GUm4dkTZgXI0EScUSkTamefv0oes3la9xk7oo0dSo
	2iF+W4QWZujL2CGEGO1gcESElhqn01PAngyIBK66R1XlY/brGim7gulUj1LHVcV4G1+oDgEyud2
	2n40GBw==
X-Gm-Gg: AYBFou3tjh2wvUiIJW/jVZu8GMWILRgLcfXyChjsjZ6+PEE3bQ6osHujt7MUglo13ch
	gz7tjkgEHLbqiqpSZxLHsZ/cVUo8JPUpCyM7J01BypCNbtyIDmmv+RZSrTWOmcBCHtJa2ETiDLW
	dQSb5N7yZwmq5wCC3lkTd+lm2zFuVGSZiG9cdcpVgSKtdmTZ1Dsh54s+rfMPyYF0+t5Pbmpb+k5
	qPsMZhNZ1p6Y3B7Fvirjlyi6iyxCNPnr+wOf0UGmcCsUj9J572EumW1CRzugwiiUg0CUm5dxNNK
	BNDERAUjly4qaTcTfizoCfFzn5BO0CedR/9xLd8fw4RjDg1nLZ6svIdLM+f6ATQFBp87RKH06p0
	pbTnn8J9iPyCWFX3V8NTHYjcHSGj8wWoLxBOj2ptyLrCfu6aMLl9JZX0t4xRHDDKILnXcqKw+74
	JXpfKlADxLGJ8+oGwt08PUi+InSTbIrFp0yV5PCvZjgsZ0zTEVv9hQj7EQ0PD+IR8IFR30pAvJV
	PQFtnMW7R7bbyMxgQZ3vZawJmTrYDRRtw==
X-Received: by 2002:a17:902:f60f:b0:2d0:1aaf:daec with SMTP id d9443c01a7336-2e5ccdbbfb0mr556185ad.9.1791235614423;
        Mon, 05 Oct 2026 14:26:54 -0700 (PDT)
Received: from google.com (230.0.127.34.bc.googleusercontent.com. [34.127.0.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8543e8478sm1491257a91.17.2026.10.05.14.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 14:26:53 -0700 (PDT)
Date: Mon, 5 Oct 2026 21:26:48 +0000
From: Lisa Wang <wyihan@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Subject: Re: [PATCH v15 03/23] KVM: selftests: Initialize the TDX VM
Message-ID: <asQWGLagCRTuEaEk@google.com>
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
 <20261001-tdx-selftests-v15-3-7c62a5d8a992@google.com>
 <20261002091331.1148B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002091331.1148B1F000FF@smtp.kernel.org>

> > +
> > +static const struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
> > +{
> > +	static struct kvm_tdx_capabilities *tdx_cap;
> > +	int nr_cpuid_configs = 4;
> > +	int rc = -1;
> > +	int i;
> > +
> > +	if (tdx_cap)
> > +		return tdx_cap;
> > +
> > +	do {
> > +		nr_cpuid_configs *= 2;
> > +
> > +		tdx_cap = realloc(tdx_cap, sizeof(*tdx_cap) +
> > +					   (sizeof(struct kvm_cpuid_entry2) * nr_cpuid_configs));
> 
> [Severity: Medium]
> Could this realloc() cause a data race if multiple threads attempt to
> create TDX VMs concurrently?
> 
> If tdx_read_capabilities() checks and reallocates the static pointer
> tdx_cap without locking, concurrent calls might race on the realloc(),
> potentially leading to memory corruption, a double free, or a
> use-after-free during test execution.

In KVM selftests, VM creation is performed on the main thread during test
setup, matching other cached helpers like kvm_get_supported_cpuid(). I
don't think we should care about potential race here.

> [ ... ]
> > +void tdx_init_vm(struct kvm_vm *vm)
> > +{
> > +	struct kvm_tdx_init_vm *init_vm;
> > +	const struct kvm_cpuid2 *tmp;
> > +	struct kvm_cpuid2 *cpuid;
> > +
> > +	tmp = kvm_get_supported_cpuid();
> > +
> > +	cpuid = allocate_kvm_cpuid2(tmp->nent);
> > +	memcpy(cpuid, tmp, kvm_cpuid2_size(tmp->nent));
> > +	tdx_filter_cpuid(vm, cpuid);
> > +
> > +	init_vm = calloc(1, sizeof(*init_vm) +
> > +			 sizeof(init_vm->cpuid.entries[0]) * cpuid->nent);
> > +	TEST_ASSERT(init_vm, "init_vm allocation failed");
> > +
> > +	memcpy(&init_vm->cpuid, cpuid, kvm_cpuid2_size(cpuid->nent));
> 
> [Severity: Medium]
> Does this memcpy() copy uninitialized padding into the ioctl payload?
> 
> Since allocate_kvm_cpuid2() allocates struct kvm_cpuid2 using malloc(),
> the padding field can be left uninitialized. The kernel's
> KVM_GET_SUPPORTED_CPUID ioctl does not clear this padding, and it is
> subsequently copied into init_vm->cpuid here.
> 
> Because the KVM_TDX_INIT_VM ioctl strictly validates that cpuid.padding
> is zero, could this cause KVM_TDX_INIT_VM to fail with -EINVAL if the
> padding contains garbage?

This might not happen in practice, as this allocation happens at the
beginning of VM creation. It would only happen if a previously freed
chunk with non-zero data is reused by malloc(), polluting cpuid->padding.

Still, we can set cpuid->padding = 0 here, or change malloc() to
calloc() in allocate_kvm_cpuid2().

