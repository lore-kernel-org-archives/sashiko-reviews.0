Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555AA4C77B7
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 12:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779192379; cv=pass; b=HJ9dT6p3PlGoh7moWVMmylLh16mjfOSnNceA2tGoXa3/4LNP613gAY+XUAtDQ7EGvx1CgH4m3RSqEO5qq0MaCK8IfxaO6/+T/i0Bbgb6A77ada8jd2s/8EQzqvM1LXV9kD66PlNqVUBGmsIIxGji2klo2l1RDIpBKoYTwdDefpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779192379; c=relaxed/simple;
	bh=CGxVSGycpBzhHRm6QLRx4kIqnzL+aHoMvldBecTAROE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q8VB+29n6dMHFDjZYDOcBS9+68hM14WDC7Z6Y1p/pn7/ugnQ7EkgNIxYJpoW1JhdG+IY9p5yMCF8UNtIZP3OzjllHg9J5jIdEgtEvI3W5BbcyMfLHaqFW80fFM/sMfpEFScaKgoUnj7AmAvVY3hrb9w7tvkWcRXWFmlsEH5/ua0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AG31+ych; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AG31+ych"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a887ebb416so4190164e87.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 05:06:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779192374; cv=none;
        d=google.com; s=arc-20240605;
        b=FOULP9IILzK7ktlcFv+AcZ91KmPmEQX9vce8p6B/FK1Pk+ftkmrw+/SI/ADJZ+XsYc
         T5dE6/rOOwXO7rUdW9ZFHL6oXjtEkaj2sq8vCMr5s6gNlXP0LtNx0Yhn+V+up5+05J0m
         sMWYk7DGDKxM3GFju70JKpBjAbU3R2GrssxcdIk09YRFx0SxT9HsrEcKdQKxTa1qtKhq
         ff6TloqY/EzDdzIOOCk0BzowMypnBQR5qgZGdThiFhs2cPeOxTlsct9z/k42sZf7W3Sx
         izJjx4hIEA1U/APk2szWMytAhFywnmD6hHUrKmYaKRnrDotdtyluh3mx8cpZmQhCqiFp
         yLog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kp7kUH9UIq+pMnPJFmd1HjQegMSsejvI9T/sI2XmpDI=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=N3QrzFQ47e7v6VM9pPMLCtusioFwxifMWyKgJNHnZiSH1qR8b3h29uELU3y+ErLGYZ
         YQFSObmF+L8W+9JK5xchgYVwoRUrWwOMCnK50wIMMkoyxcW6f7zbuMJYkvdE2jGRgijZ
         mrfUT96H0o1dqSlBr2M6PNDl8EcYKG8tARB88ouNuPD6f0wC3u6/tiZGcdn1uvkmO7t4
         97rz4UoL5JLfcYZCnc7lOsIIcirbAZydvnbHBdqlFcKZlIC3Gc8MZeO6aweSyfKjzzE4
         5iRlfR2ALo67jyOyLK/sjIbFkX1Q18MN62ftO6OWi+N6JlpZUNvbLIyFcsx9Jaya4ozC
         w99A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779192374; x=1779797174; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kp7kUH9UIq+pMnPJFmd1HjQegMSsejvI9T/sI2XmpDI=;
        b=AG31+ychxbytFJKhVf+cAtZTGSokmwfIL7dtsmtGm9NQ9BODMQVgdOqAUIp1A8uzak
         Yt5h1b5SrWvls+7kGWxgZr1BCtutHJBZjWphTH10u8qLvsGIW2RdQEiZnx9zkAqu7ZkB
         ZgtqBEOzHDRaHGuACDmnjgU6CUr0JY7NB0+DbxK1e6GjAAnwO8dqdUw0OI/RUvXiV06U
         cTsfoM5BlExzw0F2Wye9VGyd45+F2FfEnHz8Oyk78uLpnvGIQpfxsBcOWy2HismnsbDX
         0WZQ3ubBGjsvxzfR8Umsz0t1fnlpsaSRKKFqLyxLvmxx3ONDGv+1M8DeLEK9xw8L7zUd
         Jzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779192374; x=1779797174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kp7kUH9UIq+pMnPJFmd1HjQegMSsejvI9T/sI2XmpDI=;
        b=qfOsigI9rL7nF5Eqgbm+0YIUwIXddE+EUTz5q7q0G4Z1eTJeJJYJ/LG0sEhRkHhBFl
         plskB9yPvYBcg4ggvdEPnBRfS6Oe2/ObRWDRjFczW9c17xbY6CV5wQVnGVY4zs0+VRaU
         P1aDf3EWAdye7OHJw9kdf0ZQPTL9i9pmsjFd5mI/vSnYBWgmZN1b2TFUPTwMD2bHzGxD
         r91lUd/FTmZtNkP/j63ohus+W9GhHx7QvVqe0TIJK+1kEzoIBa1Dkc9CJWMoPWfKtT0p
         agY+dBxhMMg9l49C7QQ0T3/pSAdqEfoiUC0aSd+iZAb8fxOA/aSZRY9v4YuOHHARa7mB
         IGQw==
X-Gm-Message-State: AOJu0Yz6ON1GtAimDn5+bOunhrFhh125ZRXL2qpg/9hobKAJt9jLLBfO
	1CbqdJJGB2XPoTwf/+NfzrFLglyXshUWpCoVn/gZ84oQaueSUb3BbdDma1d6pqf/6kKJPiqTpui
	9AcwowQeAYh5/84olUcNp5B1rhPfRZbradG0dRtxA6g==
X-Gm-Gg: Acq92OEB4o+vnpyuPSI94Qt55G1YySJ+zNJqaQZR0+eYTmwGzo5tyiiv7AS3fXa2Es8
	pc5RzuTuU5XLSa89Iavlpr/YRlmKKhCYQBdhLhAxZjPwk8cX8bzgIbbHtUlk9SbSqbnC+51smFz
	+029+7YSFHF4Esg/JH2ZWCTXcNuvMHAhxqt4aliyxweX4c9QL5s8nrwt31iRUK8IVch4N3DnLzp
	OVWqt1m1IzC5i6Tv2wnBxVdOG8Yq0BIfe/QcR/T7L00GFsOJMjyVRBJaIfWsMEtc6yuBy0GdjYr
	yMJ19se6BBAATSlxY5XAA6wBoTF/JeDhnyGgWNt4
X-Received: by 2002:a05:6512:398a:b0:5a8:e336:b55a with SMTP id
 2adb3069b0e04-5aa0e61948cmr5619291e87.7.1779192373905; Tue, 19 May 2026
 05:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518082344.96647-7-kerneljasonxing@gmail.com> <20260519082515.AF651C2BCB3@smtp.kernel.org>
In-Reply-To: <20260519082515.AF651C2BCB3@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 19 May 2026 20:05:36 +0800
X-Gm-Features: AVHnY4J2CCAk_a1JeE9M8IeVY0qq4Nch-g9YVsRP0rcTv7eisiLVVhlScWxxLHE
Message-ID: <CAL+tcoBa3_mGcULSbvtqWvK1ZbffX9CKQXznYpvaV+du7a8Ntw@mail.gmail.com>
Subject: Re: [PATCH net-next 6/6] selftests/bpf: Add RX latency tests for bpf timestamping
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 4:25=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] The return values of `ASSERT_TRUE` are ignored in `recv_verify=
_rx_timestamp`, causing it to unconditionally return `true` on successful `=
recvmsg`.
> - [Medium] Using a fixed `usleep(10000)` to wait for a workqueue to run i=
s prone to test flakiness on heavily loaded CI systems.
> --
>
> commit 3f1fdeab36943dce908082eb563628a5f8ca353b
> Author: Jason Xing <kerneljasonxing@gmail.com>
>
> selftests/bpf: Add RX latency tests for bpf timestamping
>
> This commit extends the test_tcp() selftest to cover the new BPF RX
> timestamping path. It tests a mixed mode where SO TX/RX and BPF TX/RX
> timestamping operate simultaneously, verifying they do not conflict.
>
> > diff --git a/tools/testing/selftests/bpf/prog_tests/net_timestamping.c =
b/tools/testing/selftests/bpf/prog_tests/net_timestamping.c
> > index dbfd87499b6b5..3cc52b670e74b 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/net_timestamping.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/net_timestamping.c
>
> [ ... ]
>
> > @@ -143,11 +143,45 @@ static void test_socket_timestamping(int fd)
> >       SK_TS_ACK =3D 0;
> >  }
> >
> > +static bool recv_verify_rx_timestamp(int fd, char *buf, int len)
> > +{
>
> [ ... ]
>
> > +     for (cm =3D CMSG_FIRSTHDR(&msg); cm; cm =3D CMSG_NXTHDR(&msg, cm)=
) {
> > +             if (cm->cmsg_level =3D=3D SOL_SOCKET &&
> > +                 cm->cmsg_type =3D=3D SCM_TIMESTAMPING) {
> > +                     tss =3D (void *)CMSG_DATA(cm);
> > +                     break;
> > +             }
> > +     }
> > +
> > +     ASSERT_TRUE(tss !=3D NULL, "SCM_TIMESTAMPING cmsg present");
> > +     ASSERT_TRUE(tss && (tss->ts[0].tv_sec || tss->ts[0].tv_nsec),
> > +                 "rx sw timestamp non-zero");
> > +     return true;
> > +}
>
> Since the return values of ASSERT_TRUE() are ignored here, will this
> function unconditionally return true even if the assertions fail?
>
> If the caller expects a false return to abort early, this could cause the
> test to proceed regardless of the assertion results.

Even though it doesn't affect the result, I will add checks here:
if (!ASSERT_TRUE(tss !=3D NULL, "SCM_TIMESTAMPING cmsg present"))
        return false;
if (!ASSERT_TRUE(tss->ts[0].tv_sec || tss->ts[0].tv_nsec, "rx sw
timestamp non-zero"))
        return false;

>
> [ ... ]
>
> > @@ -187,7 +221,27 @@ static void test_tcp(int family, bool enable_socke=
t_timestamping)
>
> [ ... ]
>
> > +     afd =3D accept(sfd, NULL, NULL);
> > +     if (!ASSERT_OK_FD(afd, "accept"))
> > +             goto out;
> > +
> > +     /* net_enable_timestamp() defers the static key update via
> > +      * schedule_work() when CONFIG_JUMP_LABEL is set. Give the
> > +      * workqueue a chance to run so that netstamp_needed_key is
> > +      * active and skb->tstamp gets populated in the receive path.
> > +      */
> > +     usleep(10000);
>
> Could this fixed 10ms sleep cause test flakiness on heavily loaded CI
> systems?
>
> If the workqueue is delayed for longer than 10ms, the static key might no=
t
> be active in time, which would leave skb->tstamp unpopulated and cause th=
e
> test to fail intermittently.

From my limited knowledge about CI tests, 10ms is probably enough...

Thanks,
Jason

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518082344.96=
647-1-kerneljasonxing@gmail.com?part=3D6
