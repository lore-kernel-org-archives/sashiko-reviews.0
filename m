Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B583438A1
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 18:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790791688; cv=none; b=KR3oPp1zgqnBF65jL5wKrIfIGdj9ZuxUyo5owhUfyuBiLjerbO3rUiUVkY8Ekz2TE2D71HLnFnIl3DvkYJyURzT40nYagHi0GR4jrmUCbdyqvOAi6B1mRQTlJa0Z2I1JHX54Gt0GXAslwxd3jHJ9y98nYNQN8FCgMkhMLa2Yw+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790791688; c=relaxed/simple;
	bh=NiiQJkuccUczGrWh0LiomR77FtCqDVmyxyxwHTvsd7A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qf0Y20E97EoY8gqqratGCtJ1eU0+pDed8hDHmMEz76tJS8EGlgYo2V0GSk1cM3NfGodMgG/SnK3E7kdh2ooiMQQLYn7MVkPhJtf6llmfENypp4uANBmrJbW6EQ8o0cD0MpKpRSHG1rE7ZD8GNNlr5aqJIOdIW9nLNA2Sbrcy1PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fL6aFJxR; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fL6aFJxR"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so6794166a12.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 11:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790791686; x=1791396486; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6NNX44iKkcgMJ1PQ5IbJDGYTLu046lxpWsr4gvHBYXc=;
        b=fL6aFJxRFb19G1ezZRtALYPrqYYc6MBKpO+V5f0sH+5EMGUzHwrjgBQWcLBv4sFPCX
         ThV1fpurom4ZshxIhkmVxpxO5iT21aFdr16kVPr5A5U6S63bEwLd06QULZqUg6VC6DDB
         Yb9ZQqEvKMebEffUdQj50nw0FkHm9o0dIOiFNDIDnaOEqFfIYQwzz1AKOTIxqYNlSCT2
         IAEYQvNNpQF9df8hDnRpiugVw3cgQdANtYSTWadXLk4mAJmJSqRky/LkijUoVvPmEpXI
         aISf+ZNjbsnrmfWd17DSfhIV4bWv6YAxkdfo/Oj2NVbM9sCC2V7cAdQ+anX7KqM1q2jX
         sKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790791686; x=1791396486;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6NNX44iKkcgMJ1PQ5IbJDGYTLu046lxpWsr4gvHBYXc=;
        b=EcduhMUrUM0ZdzPq5xXBZe3eBdOJjmAc1L7G7HNwN1HJarRYKOzT1ZIwkXBfLf+fwY
         NjgcJsaZSTgplcErtI/nmq5VIbwSnQ1U4/tfZjz4bHDoOb+51p37X7GSgSdO/dzsirMF
         DIFi0mLijcYiNBKq/7dVvSxg4M/mIcngbsN78aLfexqPCvGPqbcDxeRJockPM4YQdLmH
         9YCm3GzW+sCtp0UhOruOhLqQ/+YjoCjhWKaxOI0pD9WEXkc1MGJjbFTXUQi0JhtVhLyc
         cHmYKU126dU1wV+U90ktlMomUQj0RM4dWlAlNVRw3N3PNnhM4Pk0i5NIMIVAqPqy3XMV
         V3Jw==
X-Gm-Message-State: AFuF++nUNH1+M7keTK2wBYn8LKmXzDKm5O/EP1OPQyu4II5MTv0AFBxr
	qS/nxaiaXQvmNj2n+Z3tdgd9EYpR6VRCxrwDzv570ajhiq41bGWUSeS7a8cxMUkplylCbwEWttP
	LiKdNV5X0+7Cg9QUThrgU6uEJKSmUixS6qwa44fWrN9R1Xu3+5FSq1pMbN8b5h3LHSq5DUcQiTS
	1g/JDSulYVeFagTBfa8XQGo5jov4E+CVhhDorvSK+kVunBE3EB
X-Received: from pgte12.prod.google.com ([2002:a65:688c:0:b0:cc7:d698:697e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9218:b0:3de:5ce4:9e55
 with SMTP id adf61e73a8af0-3de9e8e0dc0mr2432459637.59.1790791685923; Wed, 30
 Sep 2026 11:08:05 -0700 (PDT)
Date: Wed, 30 Sep 2026 11:08:05 -0700
In-Reply-To: <20260930175237.A8FD21F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260930173635.3362655-1-seanjc@google.com> <20260930173635.3362655-14-seanjc@google.com>
 <20260930175237.A8FD21F00898@smtp.kernel.org>
Message-ID: <ar1QBSKMGJUFBExK@google.com>
Subject: Re: [PATCH v3 13/21] KVM: selftests: Use KVM's reported TSC KHz as
 L0's frequency (sanity checked)
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Sep 30, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] kselftest: random test flakiness due to strict 1% tolerance on sleep(1)
> - [Low] kselftest: masked ioctl failure check due to u64 cast and multiplication
> --
> 
> commit 44c3625d55f5d8d3232ad8e1eb92f5cad1eaa9ab
> Author: Sean Christopherson <seanjc@google.com>
> 
> KVM: selftests: Use KVM's reported TSC KHz as L0's frequency (sanity checked)
> 
> This commit updates the nested TSC scaling test to use KVM's reported
> default TSC frequency instead of trying to calibrate it in userspace via 
> RDTSC. It also introduces a sanity check to ensure the observed TSC 
> frequency roughly matches KVM's reported frequency.
> 
> > diff --git a/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c b/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
> > index d790ab36a198e..a78585af0ffdf 100644
> > --- a/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
> > +++ b/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
> 
> [ ... ]
> 
> > @@ -212,18 +209,30 @@ static void test_tsc_scaling(u64 l0_tsc_freq, u64 l1_scale_factor, u64 l2_scale_
> >  int main(int argc, char *argv[])
> >  {
> >  	u64 l0_tsc_freq, tsc_start, tsc_end, l1_scale, l2_scale;
> > +	struct kvm_vm *vm;
> >  
> >  	TEST_REQUIRE(kvm_cpu_has(X86_FEATURE_VMX) ||
> >  		     kvm_cpu_has(X86_FEATURE_SVM));
> >  	TEST_REQUIRE(kvm_has_cap(KVM_CAP_TSC_CONTROL));
> >  	TEST_REQUIRE(sys_clocksource_is_based_on_tsc());
> >  
> > +	/*
> > +	 * Create a dummy VM to get KVM's default TSC frequency.  All CPUs that
> > +	 * support TSC scaling should have a constant TSC, i.e. there's no need
> > +	 * to calibrate the "real" TSC.  But do sanity check that the observed
> > +	 * TSC is within range of KVM's reported TSC frequency.
> > +	 */
> > +	vm = vm_create_barebones();
> > +	l0_tsc_freq = (u64)__vm_ioctl(vm, KVM_GET_TSC_KHZ, NULL) * 1000;
> > +	TEST_ASSERT(l0_tsc_freq, "vcpu ioctl KVM_GET_TSC_KHZ failed");
> 
> [Severity: Low]
> Does this properly catch an ioctl failure? If __vm_ioctl() fails and returns 
> -1, casting it to a u64 and multiplying by 1000 results in a very large 
> non-zero value (0xfffffffffffffc18). 
> 
> Since TEST_ASSERT only checks if l0_tsc_freq is non-zero, won't this pass 
> using garbage data instead of failing the test?

Eh, yes and no.  KVM_GET_TSC_KHZ existed long before TSC scaling, and while KVM
doesn't sanity check tsc_khz, i.e. KVM_GET_TSC_KHZ could return a "legitimate"
negative frequency (when those ~2.17PHz CPUs come along), in practice checking
for a non-zero value is sufficient because any bogus value will quickly fail the
functional checks.

Heh, actually, kvm_arch_vm_post_create() *already* validates KVM_GET_TSC_KHZ:

	r = __vm_ioctl(vm, KVM_GET_TSC_KHZ, NULL);
	TEST_ASSERT(r > 0, "KVM_GET_TSC_KHZ did not provide a valid TSC frequency.");
	guest_tsc_khz = r;

so this is a non-issue.  I agree it's not the prettiest, I just don't care enough
to clean it up.

> > +	kvm_vm_free(vm);
> > +
> > +	printf("L0 TSC frequency is: %lu\n", l0_tsc_freq);
> >  
> >  	tsc_start = rdtsc();
> >  	sleep(1);
> >  	tsc_end = rdtsc();
> > -
> > -	l0_tsc_freq = tsc_end - tsc_start;
> > -	printf("real TSC frequency is around: %lu\n", l0_tsc_freq);
> > +	host_check_tsc_freq(0, tsc_end - tsc_start, l0_tsc_freq);
> 
> [Severity: Medium]
> Could this strict 1% tolerance on sleep(1) introduce random test flakiness 
> on loaded systems?

Yes, but that's pre-existing, and no one has complained, yet...
