Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0A13B05A7
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 15:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785338633; cv=pass; b=Jk0SZhxnj4Dl3l9Gjm47rBwGTmM3V7HysCxM0zTKvbjIiv3Y1O4yi4QPLwTFN1Ks9ornxww+Z5jznw2yHMpagJ8FpJvhcLSfhti933xCPbWyI2N/nBmC/leRRQoeevmJgPHr9uAZ4KS11R0JZIMA/EF7y6hJouvd+LeCIjVmNRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785338633; c=relaxed/simple;
	bh=KvR+cddFigOMJS06ugQoH4iVC4ve1rtPkVOdtPRomp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nR1QAiCxd1DuYShKxrq0omHhy01xVsNW0rRXeSEkpleIYB4gHfrEf1clDW/L1IgBOqxOnL3FJ+E8/xctP7/D2S2kb/mkXtmD2Z6/s5HATE1F7bTy9AIXEdLlSylt+i1JPD1LoIEk9hHWVIa+qE6o/IvQxqMhLqbf/+oa0CdxoZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fy/M0fE2; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fy/M0fE2"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51c10ed63c0so314981cf.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 08:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785338631; cv=none;
        d=google.com; s=arc-20260327;
        b=hqSK5MJewCAklYFaJxMLfBeE5twd92kjlZF7jg//1JQCO7jcQja2bTwr30v3aNzMJ+
         wVtyRZqhwGIj+u3x2lCLstiSWpjamozYeDGETeTCoE3weh3Cc978CqTmg0uTWqoVLGse
         OPRv/xSec1P+CsAdYu/96eJmwNdxB4kNpnQ9rNfpWynyW2QDbBbppk1DlNgQcilTqPmW
         6/HFsyEm0uuuVQe8DuqLxzQC2AV18H+AJ5lqWSrDiLN7sH01qog14TJBtCrsEFNHjRGD
         ITlUcqGGLImNWGXCozv4NKhPEchcut0sa19cH/io/OQfoTU0JEkagkKzsFIZCalBC9pY
         kSaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=751kHf3xuWyu+wd3aooaxL29DUmLoKaYZairhF8FZOo=;
        fh=Pb8zIKWhmpDsxN9iAEBXY19EIsGCExdE93RVDRzQh/k=;
        b=YlD47En6qWFgkSw8yy7If+yRPelyt57C5QmhcTdkkMCYX+NsWlU27yrfiiQkitbW5/
         unioKLYG3S++o4CzC9LUebNqGGdognEo5ZB8xZ1FvdteRm9w2omEHCaqHASTisrbPwSX
         bHgEBf4gQxVQszyU7G3ETXLoTJQt5JFyno+Y4p+yF2py9gg/xZnxg5h+EyfFsTNj/IFc
         X0DnRPOZbuEKhqmZetmsrqRQeaOcuCPsIsCX8otrVCfWxyd7/kGmZ25tGdl/4M+HNHVa
         suEZVhxrlFH+DhU9BR54B4p+NsLv2t9JCeDi5+N+zMFIx5vvYr++qpHOwpcAs22nBrgr
         FVjw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785338631; x=1785943431; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=751kHf3xuWyu+wd3aooaxL29DUmLoKaYZairhF8FZOo=;
        b=fy/M0fE2WM28k+ZrwXLBn9SOVPdv7Xn1brVu7ZTF4RAcxDxpujYoCHvxiSRRzhRnM6
         GYRLGMck7H+mrCQc0EzgXCP3Xu1iNuB9lHIBjzFJkJSYgd4+rnHoZfL7B2MriJ+HFXDR
         TStaEdCOvxnH0X2ShFabs8IVC24zqObfZQiDsj5QEmVHjb/CxwnlcHWcGkxeLlsZtu8E
         /5qVppu7g9lLxcjSMIngRiwUFOuwFc4+YMNGPXdDWJZ177448P0gP+gu6vwPn97SZ90j
         WYz4QdMgAjONXkaCAYwVLi9woEZ2M7hD/0sSCR5JITqWZLSyDNgobv/ygY6RAnVT6Wbg
         YCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785338631; x=1785943431;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=751kHf3xuWyu+wd3aooaxL29DUmLoKaYZairhF8FZOo=;
        b=lbBfij3ecUqRUBPvVo23ijNRmsBdhFL8ZlifFvgGXZt/7PjtE4NObMhjif5SAXkWnT
         PXw11BZ6tMKJkjBKJc3/I5EimTCdOmrgbwS5W9cH/mjwg99sgwjvqNEkVTwKg9FUBZTL
         MxtV9DKWwhuTTrYiVKQWmc/s+8CvkJQ63RJr/9xVUUiVaAmmzn+pJgkhxSESb+S3gHTf
         mnOThspb+cnciUHOdhQ124GSGVdOO4z9i2qCgyAhMFhNMADSjNSGjzUo4kGUYvl80WQE
         6N99R9iHhcilbqLhg9TRGF07oZYLUpDq7IB13uelawdTJd63kagUeQlYLnwQdk2w+AyK
         LMjg==
X-Gm-Message-State: AOJu0Yyn/tqhDTsUX5zaKRHa7hCmw4z1RzU7SplVJgZbnNhFcVD5FJW2
	jV/Y/V2ZVSDBstmV7oNQvYHYYUfNihsBoFtyJWxVLn20KwaPtR5Fs/TKMnAag0uqO/4X0cF3cYg
	qfZND2Ut5fUWfweu79T3+9NoA1olJL6Yo734BgMJdOMHI90Otw5FComnyrJw=
X-Gm-Gg: AR+sD11uOyCxBmbg4CThVQMQDD0r73KezwqUPJ7lfOOutCIHg4GAatb3sU1/ibOUs8y
	wFCFZLVCLX3DmTc+MnVG9U2AhmX0dCldr3XrVJ1Z5Vexk9uY4enQfndZO1pRGr5QzqVFui3JT/d
	6ZyXuFSPQko/jnQ36Nuz9PAtaLaKMBKeOSWYmhWSqDLuoE9F/D9a/MxjJUUecd8bmvsIU7N1lWH
	Y+aMZEIpWHHQHoeGa3wPNGZp8AGbxrECrub6UfFRPS20RPw9L5jmUYeSwF6pbkE919J95ObdBh3
	fT96LDjjTcLOgOcUDue596ZsV0kauO9c9iDTSqeHzmFNZNq5b639t2IyyOZ2BC6lK9ZxO8TYn0U
	=
X-Received: by 2002:a05:622a:2610:b0:517:6dc0:698d with SMTP id
 d75a77b69052e-52b34ce6830mr1188171cf.0.1785338630160; Wed, 29 Jul 2026
 08:23:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
 <20260720-hybrid-v9-4-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp> <20260720060858.5AEB11F00A3E@smtp.kernel.org>
In-Reply-To: <20260720060858.5AEB11F00A3E@smtp.kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 29 Jul 2026 16:23:13 +0100
X-Gm-Features: AUfX_myAm_s5RN5CqoGtHGgWFh1C3i89D3rZXWu2TLWc1vxbN2Jerqq4ksz8e38
Message-ID: <CA+EHjTxsm6LorPDR9irVHL0gtmsUG6zUKQLBA2=8Ruy+V4UmBw@mail.gmail.com>
Subject: Re: [PATCH v9 04/16] KVM: arm64: selftests: Test SET_NR_COUNTERS
 after first run
To: sashiko-reviews@lists.linux.dev
Cc: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 20 Jul 2026 at 07:09, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The test ignores the guest's exit state and `ucall` status aft=
er executing `vcpu_run()`.

vcpu_run() does the check.

/fuad

> --
>
> --- Patch [4]: [PATCH v9 04/16] KVM: arm64: selftests: Test SET_NR_COUNTE=
RS after first run ---
> commit 0382d3a32df9349f988ca69c7b11c92e61c3d384
> Author: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
>
> KVM: arm64: selftests: Test SET_NR_COUNTERS after first run
>
> This commit adds a regression test that runs one vCPU and then tries to c=
hange
> the VM-scoped PMU counter count through an idle sibling to verify that
> SET_NR_COUNTERS fails with EBUSY once any vCPU has run.
>
> > diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/=
tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
> > index 22223395969e0..3b5bb421f401b 100644
> > --- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
> > +++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
>
> [ ... ]
>
> > @@ -622,6 +627,37 @@ static bool kvm_supports_nr_counters_attr(void)
> >       return supported;
> >  }
> >
> > +static void test_set_nr_counters_after_vcpu_run(void)
> > +{
> > +     struct kvm_vcpu *running_vcpu, *stopped_vcpu;
> > +     unsigned int nr_counters =3D 0;
> > +     struct kvm_vcpu_init init;
> > +     struct kvm_vm *vm;
> > +     int ret;
> > +     u64 irq =3D 23;
> > +
> > +     vm =3D vm_create(2);
> > +     vm_ioctl(vm, KVM_ARM_PREFERRED_TARGET, &init);
> > +     init.features[0] |=3D BIT(KVM_ARM_VCPU_PMU_V3);
> > +     running_vcpu =3D aarch64_vcpu_add(vm, 0, &init, guest_code_done);
> > +     stopped_vcpu =3D aarch64_vcpu_add(vm, 1, &init, guest_code_done);
> > +     kvm_arch_vm_finalize_vcpus(vm);
> > +
> > +     vcpu_device_attr_set(running_vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> > +                          KVM_ARM_VCPU_PMU_V3_IRQ, &irq);
> > +     vcpu_device_attr_set(running_vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> > +                          KVM_ARM_VCPU_PMU_V3_INIT, NULL);
> > +     vcpu_run(running_vcpu);
>
> [Severity: Medium]
> Does this code need to check the guest's exit state and ucall payload?
>
> If the guest payload crashes or hits an unexpected exception, this will s=
ilently
> ignore the failure and proceed. Since the test only checks for an EBUSY e=
rror on
> the subsequent ioctl (which will still be returned because the vCPU has b=
een
> run), the test will pass despite the guest crash, potentially masking
> virtualization bugs.
>
> > +
> > +     ret =3D __vcpu_device_attr_set(stopped_vcpu, KVM_ARM_VCPU_PMU_V3_=
CTRL,
> > +                                  KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS,
> > +                                  &nr_counters);
> > +     TEST_ASSERT(ret =3D=3D -1 && errno =3D=3D EBUSY,
> > +                 KVM_IOCTL_ERROR(KVM_SET_DEVICE_ATTR, ret));
> > +
> > +     kvm_vm_free(vm);
> > +}
> > +
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-hybrid-v=
9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp?part=3D4
>
