Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D553B995D
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 07:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785395748; cv=pass; b=qhZK8VEsRegiwLzXheMB4t1hhXU9wx0VtjPJGCYX8EhNMj6NqxwkiXYpHHZkMb+KXpMziAIQ5J/bMVUvBqCjRjtKAlXAHZX2YOF8I+7vZB4APDvUESTnaiXdLKN1P1BqJU1tM+E271eUL67IhGxIbrgwip7OUE+C9YDTqR59kAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785395748; c=relaxed/simple;
	bh=gTs2P4GzAID4bhAr2SIwiMP+u1/EHGaiVI3xg2u1e54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UVVte4k31dfONYwGWtbTzWUs/iPTcnRkQe2Mb12dekDZzmrZ4/YO2HEtjLZMqjlSiby8surCqXKww12ocuCpY4nvNVSdI+ptI7kFC3KZ+YrrwD3eb2lBImwzPQmwkOhVODxycE49Ye7cxsqf47h9SmwnSUGjHzMqeVWOkSgEMt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mgZflpnc; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mgZflpnc"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51c10e86e52so132661cf.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 00:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785395743; cv=none;
        d=google.com; s=arc-20260327;
        b=SnfjI4BVaD4G7d7YZlm0GDU54Eh77V6kj4fBOKGKX33I2btxqaqasMdCOEpppoMey+
         qyKLPB/bBd9Rpa0cpSEP2+3nmwGWmj546JgyhVoAI3xDwA3lqaMtwqgtT5yOSEsgiaf0
         Tm+PMGB09AcNI7NCBtQyvZZ9DDWy41oGhH7UXdwLixtOVDg3U0QWZCgx/CjPCElrnRMF
         uOE7QXcyLiE03G9E6ivL0juvEaibUwN+WGHwoc07IpCo0Ewej4K7AmMSMBFDttRrK2LI
         me55Hf/echqBlaNB1ixCviM30gEiC8D2CIUI8kJ1oOf/9KG28cikULqw5jO40h+ljMjD
         euVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rN9nZSu2sgF646io/oXLJaUoy1kgyKi5JGZhp0Svd0s=;
        fh=s14lKS+XMA4hKnGOZzcUxbtsTZ4Q2cL2nTNaOc+Y1/Q=;
        b=S0mSqbbc2BI08cmsqs9pzM8qGCtnK+EEOn9bWGd7jH28nTDFNnWu9/EqZd4HwyVl1K
         sq8hrm96dYaePJse50W+KZIaL//0VwwrTQmW7St7L2pbMoQA0k29xzFquJKi1pkQPywZ
         AaQtYzcnXNFrjWYChUVM+zQdoJ8/xIrLOWL4BacRfbP0rZuQz6KOPFSKgPyWN6jhHdtS
         6TE6YTSVzRUzuRSmPcJas7yqgp/wLyHfBbD4Z5/+Iqqyim0wmCd5UbcCrYMwW/97Mp/E
         CkHlQPJkN05I9rYP8FH2soa0WKTmKFPgZ2OgNXX9Q3PTcRRJKug4yRFb2GjNgQMvloTF
         VXDQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785395743; x=1786000543; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rN9nZSu2sgF646io/oXLJaUoy1kgyKi5JGZhp0Svd0s=;
        b=mgZflpnc54mr6ghkP2FIWcMguheThCIOyYn7b4JcYvdddQ5mpa+uNfExqMfh6Z4CY6
         KQ4duwqzupefsUDCMfDneJR9ULi+3DfL7UUU7ZFbS/2+OcFr63C/70uvtuMOodKJ3vLH
         +eWbSJcl/NhlYmvN0k9H6VscTLK7ZVEF1qcAM6ClZz5UGgpbTVHKOAtJdNQLVDc9Zq8a
         RYAPXMqtfpY7L4N8BHZVB5Wau1382bZHv/gaBMwI7VorcM+M4vq/knNs249Lh+Gwufb1
         8CgZxh0KiuXS9vshR8kTsCVWR3Aq6yb1P3UcqC3NVgGNM9KQ93N+KJD2r2PIyRNJEBrG
         Yk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785395743; x=1786000543;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rN9nZSu2sgF646io/oXLJaUoy1kgyKi5JGZhp0Svd0s=;
        b=P5X4eyTex98C8z3gvCWKTSPzVu06MXOXiDgjNYEm0GVWUIHAhCHb+7batqpHwzsNNA
         JiI2KAkIOIO7EcAhHeWwVgTOvEM+XUdXN0j5XUzdYPu5baxCqIA+jMJcu67HAjrEG/0D
         AlBzUU+3avrsk4D0d5nPygiPqfakXIYd2BRHQsW3naf8sJv6BqHJZ5gemokyqw6z2Nrd
         qHNhaxqaOOuimH9aFfl43Z74DR/ttOXRgzImklZ4qOoeo+LDBHXuY8VbwXwp0EPrZcl5
         fXmT06BGXWHNiDJGx6Fo2xHxKCj18qKrgH3llhfChEiHLrkHuUeG+A32RhnkjHJmZUTP
         /81Q==
X-Gm-Message-State: AOJu0YxnTHBMv5vdjuLSoFzDadsbXZjD6Erz6JtnvB6dG/QlX82BhQw6
	CwCx0n22XsYl5VhU9RXxKO7hPUY+sVJPO2SgAT6CL/6cAMZOJi5lXBguuA8g+SXsx7gYQUR+4yF
	/CgvVCrJseLN4AutzhKZB0jLy1Tk0YPyu/hPEN3jJZxg7TS7bf+4TDtFF
X-Gm-Gg: AR+sD11ZIzg1ZFSjsHGstnDXbn7YQucM98k9jtDPpra2Nmy5TUkzMdGg+LSrd4qroBX
	JvCmTHLzIP9GFakPJYchtk8+1dYtpAkNy1aWdwaRw4TjCZJnP+VCwxGnIxGnaQuydsZA6uM/dhn
	ePY24NGgeL/6hZMtUeWCsaUMPOEXkxEfyoese5F50ju2xzzR86XPZ3YZPl+oJAjrqC4G0dh3NHc
	57erKH07WYix6SiJtRC1UeSm1eYNsOJtd7QDeynhQsdo7/pza0QJC1wp4Meg9KuaatAZt4pc//9
	FfUJ8xgzjg4Bz0pOw18buLIpQmsikBJfk8dSVZukyqvZ
X-Received: by 2002:a05:622a:4c0f:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-52b394ab403mr10203301cf.1.1785395742273; Thu, 30 Jul 2026
 00:15:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
 <20260720-hybrid-v9-4-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
 <20260720060858.5AEB11F00A3E@smtp.kernel.org> <CA+EHjTxsm6LorPDR9irVHL0gtmsUG6zUKQLBA2=8Ruy+V4UmBw@mail.gmail.com>
 <1e5e1a1f-51ce-4c0c-8690-b5472cc7bd2e@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <1e5e1a1f-51ce-4c0c-8690-b5472cc7bd2e@rsg.ci.i.u-tokyo.ac.jp>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 30 Jul 2026 08:15:05 +0100
X-Gm-Features: AUfX_mzT91a3nV9pfht0OxPLB6AnFlkwl7Cs0rin5LW0Nvy9x0kjFieO4FqmSfQ
Message-ID: <CA+EHjTyhOqMti7q+OB8S7K-F48iMr9_FntAmW-jvfZmOC5JEHA@mail.gmail.com>
Subject: Re: [PATCH v9 04/16] KVM: arm64: selftests: Test SET_NR_COUNTERS
 after first run
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 30 Jul 2026 at 06:44, Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>
> On 2026/07/30 0:23, Fuad Tabba wrote:
> > On Mon, 20 Jul 2026 at 07:09, <sashiko-bot@kernel.org> wrote:
> >>
> >> Thank you for your contribution! Sashiko AI review found 1 potential i=
ssue(s) to consider:
> >> - [Medium] The test ignores the guest's exit state and `ucall` status =
after executing `vcpu_run()`.
> >
> > vcpu_run() does the check.
>
> vcpu_run() itself doesn't. run_vcpu() calls vcpu_run() and then performs
> the check (their names are so confusing here), but the new test bypasses
> run_vcpu() and therefore does not perform the check. I'm planning to
> rework the test to use run_vcpu() with the next version.

So Sashiko was right :) Fixing this would be good, thanks for pointing it o=
ut.

Cheers,
/fuad

>
> Regards,
> Akihiko Odaki
>
> >
> > /fuad
> >
> >> --
> >>
> >> --- Patch [4]: [PATCH v9 04/16] KVM: arm64: selftests: Test SET_NR_COU=
NTERS after first run ---
> >> commit 0382d3a32df9349f988ca69c7b11c92e61c3d384
> >> Author: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> >>
> >> KVM: arm64: selftests: Test SET_NR_COUNTERS after first run
> >>
> >> This commit adds a regression test that runs one vCPU and then tries t=
o change
> >> the VM-scoped PMU counter count through an idle sibling to verify that
> >> SET_NR_COUNTERS fails with EBUSY once any vCPU has run.
> >>
> >>> diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c =
b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
> >>> index 22223395969e0..3b5bb421f401b 100644
> >>> --- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
> >>> +++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
> >>
> >> [ ... ]
> >>
> >>> @@ -622,6 +627,37 @@ static bool kvm_supports_nr_counters_attr(void)
> >>>        return supported;
> >>>   }
> >>>
> >>> +static void test_set_nr_counters_after_vcpu_run(void)
> >>> +{
> >>> +     struct kvm_vcpu *running_vcpu, *stopped_vcpu;
> >>> +     unsigned int nr_counters =3D 0;
> >>> +     struct kvm_vcpu_init init;
> >>> +     struct kvm_vm *vm;
> >>> +     int ret;
> >>> +     u64 irq =3D 23;
> >>> +
> >>> +     vm =3D vm_create(2);
> >>> +     vm_ioctl(vm, KVM_ARM_PREFERRED_TARGET, &init);
> >>> +     init.features[0] |=3D BIT(KVM_ARM_VCPU_PMU_V3);
> >>> +     running_vcpu =3D aarch64_vcpu_add(vm, 0, &init, guest_code_done=
);
> >>> +     stopped_vcpu =3D aarch64_vcpu_add(vm, 1, &init, guest_code_done=
);
> >>> +     kvm_arch_vm_finalize_vcpus(vm);
> >>> +
> >>> +     vcpu_device_attr_set(running_vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> >>> +                          KVM_ARM_VCPU_PMU_V3_IRQ, &irq);
> >>> +     vcpu_device_attr_set(running_vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> >>> +                          KVM_ARM_VCPU_PMU_V3_INIT, NULL);
> >>> +     vcpu_run(running_vcpu);
> >>
> >> [Severity: Medium]
> >> Does this code need to check the guest's exit state and ucall payload?
> >>
> >> If the guest payload crashes or hits an unexpected exception, this wil=
l silently
> >> ignore the failure and proceed. Since the test only checks for an EBUS=
Y error on
> >> the subsequent ioctl (which will still be returned because the vCPU ha=
s been
> >> run), the test will pass despite the guest crash, potentially masking
> >> virtualization bugs.
> >>
> >>> +
> >>> +     ret =3D __vcpu_device_attr_set(stopped_vcpu, KVM_ARM_VCPU_PMU_V=
3_CTRL,
> >>> +                                  KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTER=
S,
> >>> +                                  &nr_counters);
> >>> +     TEST_ASSERT(ret =3D=3D -1 && errno =3D=3D EBUSY,
> >>> +                 KVM_IOCTL_ERROR(KVM_SET_DEVICE_ATTR, ret));
> >>> +
> >>> +     kvm_vm_free(vm);
> >>> +}
> >>> +
> >>
> >> --
> >> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-hybri=
d-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp?part=3D4
> >>
>
