Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902A93F86FA
	for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 11:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779881784; cv=none; b=iAY3BMLTxF6Uo7RPDV9XzmJh3Q07SdtPSw9hbRQTnQBAhVFz9zveshcrF1Dg/BL9EnSUVDB/+Y2rZ+8xO2yr9tXIxbsXGQ1Y1klt6uPUB2fLsUJkUbwxzeiV0+TIVGXNRa+hrQG2xCc51aHeHRSocdouaR9ww2D56fnn7QOBUBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779881784; c=relaxed/simple;
	bh=Ox1/u8ETRmBP8fbh96OnHd4k0Ijf3t81yA3eK1b17q0=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=XV8oMb5CAsZROpLCpKn47vmrpy19L79fMJFjbHOeeViJEAbivEAQVAIG/mTEgfXTwojmEL+6gEpY7U8tlKFQ9e3oxluLQAB0OTVBzSXiLT0GK/+XWPS6E3CyugEq2EBu7piA+xJqCR6/dgCrFWMuHJIZbD1WUGxrizpZzWO+mc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0eRlfuj; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0eRlfuj"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36a7bbb9698so2876252a91.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 04:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779881778; x=1780486578; darn=lists.linux.dev;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OBwJckIjnNMjSafxeOFpVmfknD9YcolFfX87IwoV4Hs=;
        b=K0eRlfujLepI50susRgT+7I4UwtThYnCGCc0EURqYGsstgrSFeaGd7IWzEAoxi6S3L
         4GVZ28jZQi+o6yHE0QS9vx08BMKXzQNpaRpNnIVzbdJ+2y3wji4nE/3ws0GlEfgj9Dtt
         bTSnubpuHAZPzlFj460j7eQ6l9zavgzqjH2helTDbN4I7vSGrNAxyRsPhAm8sMwhsNoW
         vbggJu7ONLihLi2U/TJPeHZ6CNFNeZTebkkZ5/xK2Xr4HWK8i2YrVnYwF+ZIb5xLfeln
         r02bUMRILle3UEvDB4RS7rNKnQHCkU5kf665Bmao7dGqkqBzWusdiy760XQKecHbzjli
         KWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779881778; x=1780486578;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OBwJckIjnNMjSafxeOFpVmfknD9YcolFfX87IwoV4Hs=;
        b=I01g1PWPtN6BQCa5LcumfY/T1Tza5PG9ncj6F8ZzY+HK0XGX5iL2SCSle5jpKBi+H8
         JEpLoBWC+lRc1OCeZssflXz0GKLUYCorDv74QfR7JxTu0x5m2W24uvanHnTK8QkLkUG5
         IojXQBE+HUXrNbVuGwyIIOel17ddZv4cfFvb9o2doyOtZ9sxTfxD7r/729XgalpiGval
         Bd6o/0KtqygjE7cbKbd8UlA2spHEpwJZUpr/B2xjpSm+SiODu+mxB5cOk3xSZ7K+0OBu
         QAuyBDulv6ly3EEaXr+Ak1Py5H9gIMdW36nRdct72goJQwgcoiSp4HxWCPrARyFo12s1
         OgeA==
X-Gm-Message-State: AOJu0YzsSRJzMjifR8FIPFB1iBFmDYlDl7ci+N/xvffKmdY2/9NFnvmZ
	P0TDsG2QgmSTs+9ut/ze8FzqUVsL67RaALnS8scpKy10Lb29B/cg0GEd
X-Gm-Gg: Acq92OGVyZOK9qKVSiT/FBJp0neTLpE8Rnpc5uHUBZ6taJWevMl98LQocsdGzTakAxm
	AJvvKF8B98oKFvuMYgTUkGNldh5rmXNEhzySI4Ho93w7I0Jn4WLJltZLsEOtUinX//QFIu2Hq7p
	G8nXkCOjVFdnwiFZomdek9gXw3VqbmUAr7S6c3+eZPDPsHukfLH4WnHGgeBZ+Wt9xrtrJx4qH+o
	fSPd8T8vas483TJKWeoul5ATW3eIHPpoWfc6XognvagB4t52rxF/JCa8KqNwPcK7BrDVuoHC5/2
	7YPyhEkFb3QEpMFOWNB1+LtqKK1v+mW8wQMinvlcBV5OclPsnko1HXQpIMmLjl6xDYmW5bSjYEE
	QYvSN1HWq+M88FpLUnrAtYrgaM68zf0TrioiXUT0Irg8FhwJYStRy67k7ZFrNglb8B3dDEKBMFd
	vJ5GNDWRLSXdqZZv2ETuvGDw==
X-Received: by 2002:a17:90b:38cc:b0:361:45df:102 with SMTP id 98e67ed59e1d1-36a6765b589mr21645367a91.17.1779881778307;
        Wed, 27 May 2026 04:36:18 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b24d9c5edsm798906a91.3.2026.05.27.04.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 04:36:17 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Subject: Re: [RFC v2 5/5] KVM: selftests: Print the vcpu_id when KVM_CREATE_VCPU ioctl fails
In-Reply-To: <20260523124853.102E61F000E9@smtp.kernel.org>
Date: Wed, 27 May 2026 17:00:56 +0530
Message-ID: <qzmx6qdr.ritesh.list@gmail.com>
References: <12184d5eda089814659d5a861b3ebc30d42733a3.1779524962.git.ritesh.list@gmail.com> <20260523124853.102E61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The added `pr_info()` call clobbers the global `errno` variable before it can be read by the `TEST_ASSERT_VM_VCPU_IOCTL()` macro.
> --
>
> commit 9022e7c111e4121ff5a4ed4a90dcbfd2df0a62cd
> Author: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>
> KVM: selftests: Print the vcpu_id when KVM_CREATE_VCPU ioctl fails
>
> This commit adds a debug print statement to display the vcpu_id and errno
> when the KVM_CREATE_VCPU ioctl fails.
>
>> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
>> index 0dc67c1502cfb..6a0ee68036236 100644
>> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
>> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
>> @@ -1354,6 +1354,9 @@ struct kvm_vcpu *__vm_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
>>  	vcpu->vm = vm;
>>  	vcpu->id = vcpu_id;
>>  	vcpu->fd = __vm_ioctl(vm, KVM_CREATE_VCPU, (void *)(unsigned long)vcpu_id);
>> +	if (vcpu->fd < 0)
>> +		pr_info("Failed KVM_CREATE_VCPU for vcpu_id %u with errno %d\n",
>> +			vcpu_id, errno);
>>  	TEST_ASSERT_VM_VCPU_IOCTL(vcpu->fd >= 0, KVM_CREATE_VCPU, vcpu->fd, vm);
>
> [Severity: Medium]
> Does this pr_info() call clobber errno before it can be evaluated by
> TEST_ASSERT_VM_VCPU_IOCTL()?
>
> Since pr_info() uses standard C library print functions, it can modify errno
> internally even on success. TEST_ASSERT_VM_VCPU_IOCTL() captures errno
> to detect specific failure modes and to format the assertion error message.
>
> Could this cause the test framework to print an incorrect error code or
> bypass checks like dead VM detection when KVM_CREATE_VCPU fails?
>

yup, I will fix this in v3.. Something like this -

+       if (vcpu->fd < 0) {
+               int saved_errno = errno;
+               pr_info("Failed KVM_CREATE_VCPU for vcpu_id %u with errno %d\n",
+                       vcpu_id, saved_errno);
+               errno = saved_errno;
+       }

Also I noticed that all other KVM selftests have moved from

uint64_t -> u64
uint32_t -> u32
uint8_t -> u8
int64_t -> s64
...

So, I will add separate patches on top of the current patch similar to
how it was done earlier to convert powerpc kvm selftests as well - to
keep the review simpler w/o mixing too many changes in v3.

-ritesh

