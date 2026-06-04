Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A1B1EF39E
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 20:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780606521; cv=none; b=IphHviPK0FxzGJFt0tiaXlFL/khd1ONOGMcbX70eeZN77Za5X0qpSeZEtHnVHOi18uKcNS/k/Nm+l8aXCTncHvxU156CZ6FTcqvvXKoowaREOhWgQNDBgQAzQvdPDEAz08nkx87U/qGmeyaDWIMiOaAXAm8CTHAJXr3nuHSfFJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780606521; c=relaxed/simple;
	bh=YcA+3cLfFlgGMhdot3OA0vwOMNJFpd8MCh8dXc8TXls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aMt4MCJH69RskTFNNStc2BwIfxoaxMIUzHEbkjAR7u43/8xmM8VnZ/kKMtEBy6/c4KvTiAT8NHbSEspnt9G7RJn3pjbW/Z7b6QkMpHm1oqIYAMVQ3wB+FcTWJOj9zFixk9iC2aJS+nwCNfUEVuelT1BmhacbfdbT7LvDQnLHRiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=arrvKQRN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="arrvKQRN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 686691F00893
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 20:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780606518;
	bh=DufqYPuEoJWtXvA61S9Dop+yvHrkDSLqdvmLRTU212U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=arrvKQRN4w8VZMwwjbuuwpRER9Nm81QcFuzOIndnzIPavJEbkCamyQSjcZoUBNFay
	 olgtke6lsHqlbYAWFHo/n3hwij0aP1AOcyWHyz9GSXXTY0Pae6mXpp+u192//vQWQJ
	 j1iTY0Hn7mmvH68ou2vw/MeZUBUPVIKh4Jzk7n4wegxH/ZnYZMyd0Xju7dmDFXGiJA
	 z8oKbyHloJsaYtxHVRMe/JzQLWyir/3TjNKOmqLvKtqpm/PcMKRvBHKS84miIKz9rE
	 M3sv4D9u76JqrwgDOh1+vT8Fw8/1s2JcoLePLIJgkuw15gf5OC8/B89uFQaxoBTBR8
	 J+zzdu/ECJhiw==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-68f1e28f258so2196926a12.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 13:55:18 -0700 (PDT)
X-Gm-Message-State: AOJu0YzUmJgY3XI6VwBIZZ5rsZMWr3EQYE89FTumDPbbEYNvOhl1i09I
	Vw5Qowtu50AZ6vAoASI7iKEb125p7qJnHPBu7wUOV6FaOD3Cl3UabtIeB+FH0Z+sOYSmdA9XSIQ
	hMpQf6CoMHkpTFqFbInuH7F6BGIIxF84=
X-Received: by 2002:a17:906:c10c:b0:bec:e425:b751 with SMTP id
 a640c23a62f3a-bf370477c7fmr19087866b.14.1780606517383; Thu, 04 Jun 2026
 13:55:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260604203546.365658-9-yosry@kernel.org> <20260604204911.80D601F00893@smtp.kernel.org>
In-Reply-To: <20260604204911.80D601F00893@smtp.kernel.org>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 4 Jun 2026 13:55:06 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMQrKy8YTNebBVXLt3Zsrbym57wOsbv1Rw-vGFO-osjnw@mail.gmail.com>
X-Gm-Features: AVHnY4KRZL8ppz3igzCE313I-cbZxHZ6-sFNls6V8GJTgvzoAUGcEtDN5xCTDcw
Message-ID: <CAO9r8zMQrKy8YTNebBVXLt3Zsrbym57wOsbv1Rw-vGFO-osjnw@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] KVM: selftests: Trigger save+restore randomly in
 the #PF stress test
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 1:49=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Aggressive 100us signal interval causes test livelock and spur=
ious failures on slower hosts.
> --
>
> commit bf3ad650cf1e2ff2e1e4bd996b52e985a3657486
> Author: Yosry Ahmed <yosry@kernel.org>
>
> KVM: selftests: Trigger save+restore randomly in the #PF stress test
>
> This commit updates the #PF stress test to trigger exits and save/restore
> operations randomly via a background thread sending SIGUSR1. This replace=
s
> the explicit GUEST_SYNC() calls to better exercise race conditions during
> guest execution.
>
> > diff --git a/tools/testing/selftests/kvm/x86/stress_save_restore_pf_tes=
t.c b/tools/testing/selftests/kvm/x86/stress_save_restore_pf_test.c
> > index 622d102179e66..92efb7ac9d95f 100644
> > --- a/tools/testing/selftests/kvm/x86/stress_save_restore_pf_test.c
> > +++ b/tools/testing/selftests/kvm/x86/stress_save_restore_pf_test.c
>
> [ ... ]
>
> > @@ -94,15 +96,41 @@ static void guest_access_memory(void *arg)
>
> [ ... ]
>
> > +static void *sigusr_thread_fn(void *arg)
> > +{
> > +     pthread_t vcpu_thread =3D (pthread_t)arg;
> >
> > -             GUEST_SYNC(guest_faults);
> > +     for (;;) {
> > +             pthread_testcancel();
> > +             pthread_kill(vcpu_thread, SIGUSR1);
> > +             usleep(100);
>
> [Severity: Medium]
> Could this aggressive 100-microsecond signal interval cause a livelock on
> slower hosts or nested environments?

Not sure if that's practically a concern.

In earlier iterations of the test, I remember higher intervals not
reliably reproducing the bug, but trying now, seems like this is no
longer the case. With 1 msec the bug still seems to reproduce
reliably, at least on Turin, and we get a lot more page faults. The
overall test runtime doesn't change much either.

So I think we can do usleep(msecs_to_usecs(1)) in the next version.


>
> If the KVM VM-entry and EPT/NPT setup takes longer than 100 microseconds,
> the pending signal might cause KVM to abort the entry and return -EINTR t=
o
> userspace before the guest makes any forward progress.
>
> Because the main loop fully destroys and recreates the VM on every iterat=
ion
> (via kvm_vm_release() and vm_recreate_with_one_vcpu()), the MMU state is
> dropped, meaning the next loop starts completely cold. If every entry tak=
es
> longer than 100us, the test will repeatedly fail to enter the guest.
>
> >       }
> > +     return NULL;
> > +}
>
> [ ... ]
>
> > @@ -175,8 +215,11 @@ int main(int argc, char *argv[])
> >       }
> >
> >       sync_global_from_guest(vm, guest_faults);
> > +     TEST_ASSERT(guest_faults > 0, "No guest page faults triggered");
