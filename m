Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D62D3D16F1
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 21:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785447097; cv=none; b=qN/uo5GEgkXmkt/IuivwaaNO2WUXeJOL/9eaPnuFyMj4nVDnsfY7FCuho/+Uoclb5nTSJIzd+QfNCRonAC4Tw6KRZ0zIdXv5Iq4Jr90YpzNiOkNbrScdw+ffHhXR4SBpD9T/oMa7tFKodQlQ6mv9a1omomeSKvTNYzV0VTtaD+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785447097; c=relaxed/simple;
	bh=O87oU9Fb3GfKmf6vbnol7Em2lHY9Uv+VCYWvp85rtP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvEFUBPcFKMB9tLOMAvCGWLbaPhucGwiz3Aqt12yuSjm2csi9q4OOv5jGoS3vp4FyZtkR0b965mSUq3AlXmcwJduEJQmiJFqOxGOQ2C23Ie8SEyci8rMZrlHhclRioHL9wFzJJcDwC8bl5xnQb8I3Yk4j0HKRbk2hwiZ0k4mqVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GzqI5SIX; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GzqI5SIX"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so1995555e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 14:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785447089; x=1786051889; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O4aYxqAdUOYM4AMAjFlgTBaleZEy4IWPgN5zXutE3dw=;
        b=GzqI5SIXtx5YW/SSYyGL6JamDtGjZC3qdEca7wEdXO6uOnYNfswz2eGupU2s6WUwiK
         TfR4QTMW0uuF0GwgHQ6Dhs+2dvMNbafIz4/c+E50ZfX6rxfqVeEwgfBTl0oCrxyLuxmD
         o3ncYGMxNI1ZFYoLjI8A6dcL98/bznQ/ZRxe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785447089; x=1786051889;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O4aYxqAdUOYM4AMAjFlgTBaleZEy4IWPgN5zXutE3dw=;
        b=raFHZsQpP2uDaqGGj+yuKrXMP6H8FZXTPtn5JEZNEt7/UkJHrB+8kVWFgAhbVsTzPM
         yOJuhJxWqLsvp8iw8tgRZx5Li2fwv25PzZ96YZ7jB4wQxBfHYDWx/dgzVUosINTf/JgS
         quZwlf1C7TvZaOlzDDTZKOHPY0nLTPjAubF5JaYcaVCK8+973aYPM4Ceg5SZUpESJc0c
         MvQQCojFYCnVmlsb+0zXGY30KXNkIm7/fRGr7LkN7vZTT7Be6mewVjwjQhX4L0rrrGTK
         6S18OI+WxyXSoHlB04h2Qelu2QDmPSUB3xgBQNr7c7reB3kBqyoJtnoiFN50EnQWFRmz
         GvSw==
X-Gm-Message-State: AOJu0Yyozq7kXFjYJ1anDm60B9E7hw3qYxCAwQ+w02BXQ21cukuowucd
	PQjaH2OE2XMdLrzwpIubMNOtsnrBrqUaJjxMpTxqUlw2asfL0eZTbfxBuQ1ZJqrBytu+bhN7meo
	sfPH5OaEf
X-Gm-Gg: AR+sD11DSMyFNYhCNC6rlahYXVmCqK8W5lrG7SRiK8pBOiLAX6jCUbZBMOP8JOwcyFp
	fWSCMOxmbE/qxIxbJqdukvHAXLIt+3lAfQDlFrA/Qyi36OrXf5eGWObMW+XdGj3nn/dIpyqfb/b
	Hd26t2djSgOp/HDOHincRkodf/FcJbWFm0BFI2q3cD3lK9vEZmL3SRNB11yfiwLb7nyhBeOJvzc
	jJBlreKK5JIMm6Oy5nzQDNklfRwmt6xm0Z/LwjCgXisWXm8lfibDyPmJ1tH0OxvFyVg1Q5bP94N
	ZPd1jrsQK8u53nz/O/CZaWb7IgqsMIoRzUurL2ghRwjWFWimwpXt4OjHKLyJgf5y4YOD8rC/YMu
	5OXTNdezdb0IZB+Kpdd6P9xSwXERLUynrcaid4RgdA3IR5eYVynCpXa2QjxR2JM5M7G1Wjsp71/
	lr4ANMMW+75bFNLIGrxwuUlOxTla64PNgf1jKlgGTMJFwe6sCdQNwk4IMHcBbuuD8=
X-Received: by 2002:a05:600c:4747:b0:495:4811:d71c with SMTP id 5b1f17b1804b1-49800e7592fmr59495625e9.13.1785447089066;
        Thu, 30 Jul 2026 14:31:29 -0700 (PDT)
Received: from google.com ([2a02:a31b:20c3:6680:c10c:309:fdd2:f109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88e439asm8757792f8f.11.2026.07.30.14.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 14:31:28 -0700 (PDT)
Date: Thu, 30 Jul 2026 23:31:25 +0200
From: Dmytro Maluka <dmaluka@chromium.org>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Subject: Re: [PATCH 1/3] KVM: selftests: Fix treating KVM_CAP_MAX_VCPU_ID as
 inclusive
Message-ID: <amvCrTMCjgkjtGVx@google.com>
References: <20260730182425.1223530-1-dmaluka@chromium.org>
 <20260730182425.1223530-2-dmaluka@chromium.org>
 <20260730185243.CD3201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730185243.CD3201F000E9@smtp.kernel.org>

On Thu, Jul 30, 2026 at 06:52:43PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The selftest changes assert that setting `bsp_vcpu_id` equal to `max_vcpu_ids` (the exclusive upper bound for vcpu IDs) will be rejected with `-EINVAL`, but the KVM kernel code was not fixed to enforce this and still returns success, causing the tests to fail.
> --
> 
> --- Patch [1]: [PATCH 1/3] KVM: selftests: Fix treating KVM_CAP_MAX_VCPU_ID as inclusive ---
> commit 985e68429c6e20e59d983752bd84f5dc599b83f0
> Author: Dmytro Maluka <dmaluka@chromium.org>
> 
> KVM: selftests: Fix treating KVM_CAP_MAX_VCPU_ID as inclusive
> 
> This commit updates KVM selftests to treat KVM_CAP_MAX_VCPU_ID as
> exclusive rather than inclusive. It modifies the tests to assert that
> setting a boot CPU ID or vCPU ID equal to or greater than the maximum
> capacity will fail.
> 
> > diff --git a/tools/testing/selftests/kvm/x86/max_vcpuid_cap_test.c b/tools/testing/selftests/kvm/x86/max_vcpuid_cap_test.c
> > index 7e2bfb3c3f3ba..43f16c052de4a 100644
> > --- a/tools/testing/selftests/kvm/x86/max_vcpuid_cap_test.c
> > +++ b/tools/testing/selftests/kvm/x86/max_vcpuid_cap_test.c
> > @@ -30,22 +30,25 @@ int main(int argc, char *argv[])
> >  	if (kvm_has_cap(KVM_CAP_SET_BOOT_CPU_ID)) {
> >  		vm_ioctl(vm, KVM_SET_BOOT_CPU_ID, (void *)MAX_VCPU_ID);
> >  
> > -		/* Try setting KVM_CAP_MAX_VCPU_ID below BOOT_CPU_ID */
> > -		ret = __vm_enable_cap(vm, KVM_CAP_MAX_VCPU_ID, MAX_VCPU_ID - 1);
> > +		/* Try setting KVM_CAP_MAX_VCPU_ID below or equal to BOOT_CPU_ID */
> > +		ret = __vm_enable_cap(vm, KVM_CAP_MAX_VCPU_ID, MAX_VCPU_ID);
> >  		TEST_ASSERT(ret < 0,
> > -			    "Setting KVM_CAP_MAX_VCPU_ID below BOOT_CPU_ID should fail");
> > +			    "Setting KVM_CAP_MAX_VCPU_ID <= BOOT_CPU_ID should fail");
> 
> [Severity: Medium]
> Will this assertion now fail because the kernel code hasn't been updated to
> enforce this behavior?
> 
> Looking at how KVM_CAP_MAX_VCPU_ID is handled in the kernel, it checks:
> 
>     if (kvm->arch.bsp_vcpu_id > cap->args[0]) {
>         r = -EINVAL;
>         break;
>     }
> 
> If both kvm->arch.bsp_vcpu_id and cap->args[0] are set to MAX_VCPU_ID, the
> greater-than condition evaluates to false. Will the ioctl return success
> instead of -EINVAL, causing this test to crash?
> 
> [ ... ]
> 
> > diff --git a/tools/testing/selftests/kvm/x86/set_boot_cpu_id.c b/tools/testing/selftests/kvm/x86/set_boot_cpu_id.c
> > index 8e3898646c69d..1c4ebdf8e82c5 100644
> > --- a/tools/testing/selftests/kvm/x86/set_boot_cpu_id.c
> > +++ b/tools/testing/selftests/kvm/x86/set_boot_cpu_id.c
> > @@ -39,8 +39,8 @@ static void test_set_invalid_bsp(struct kvm_vm *vm)
> >  	int r;
> >  
> >  	if (max_vcpu_id) {
> > -		r = __vm_ioctl(vm, KVM_SET_BOOT_CPU_ID, (void *)(max_vcpu_id + 1));
> > -		TEST_ASSERT(r == -1 && errno == EINVAL, "BSP with ID > MAX should fail");
> > +		r = __vm_ioctl(vm, KVM_SET_BOOT_CPU_ID, (void *)max_vcpu_id);
> > +		TEST_ASSERT(r == -1 && errno == EINVAL, "BSP with ID >= MAX should fail");
> 
> [Severity: Medium]
> Does this change also cause the test to fail against the current kernel?
> 
> Looking at the KVM_SET_BOOT_CPU_ID handling in arch/x86/kvm/x86.c:kvm_vm_ioctl():
> 
>     else if (arg > KVM_MAX_VCPU_IDS ||
>              (kvm->arch.max_vcpu_ids && arg > kvm->arch.max_vcpu_ids))
>         r = -EINVAL;
> 
> Since the kernel checks if arg is greater than max_vcpu_ids instead of
> greater than or equal to, will setting arg to max_vcpu_id return success
> here and trigger the TEST_ASSERT failure?

Yeah, I should split this selftest patch into two: the changes which
prevent the KVM fix from breaking the test (and thus should go before
the KVM fix) and the changes which break the test unless the KVM fix is
applied (and thus should go after).
