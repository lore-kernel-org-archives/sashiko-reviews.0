Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFD13064AE
	for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 04:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781844652; cv=pass; b=qbNuQSC6kh+AvxIWWw+AxbsR2kaBPDOpM9EBQVv0KfnooF9Ptp6QcAOnp74wmTqzhivDgNOryIg9qzCIkf8wddRtuk980lr+qtFt4wm0V7Xr2EPl/AZW5x187YVRB5wCqb36RdMsqtzJbKlHemCHEiB177cku0oeYeK7DbkgMjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781844652; c=relaxed/simple;
	bh=hB9u4DRdQqn052bt6peJU7HSp23Mv+TCxzIKFIk6juA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dxbv0TrDOdpob3z6QWy0G2mCzQ3cyWJumJWRplwqigGE3gT8sbSWmyW0BJUfl4yueraT8UaIrP5idPj0XLsLbCMAGG3l2Z3iJ36jxrTlnIOOyOa4ofdho010JQLusafVETdD1HAxtpsxwF2LLPXIgzVzSvlInRNFkW+IHh+fJ0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sY9dAJLP; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sY9dAJLP"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-660e9fe3c3aso1053510d50.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 21:50:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781844650; cv=none;
        d=google.com; s=arc-20240605;
        b=AHAvpH1gqXZkLedcp4knBT2sgVRLifFAXqueOn6Fe3EsN+fbAQSVboBXIHJtYPrFwd
         8u8ntpr3A32DCQZ6pn2nWgq0Hbvus+F0+VjXfPpfPiLsMmnRBXiAS9FYsZnYKFLdH2Oy
         anfM+TT8V5gvenxy7rgVph+jcUNgqKm6k/P6Bs26bEb81zEr2UBcqhf/+YBHlJ0H6VzQ
         k7NYIfB9bNHoSriZ0aF0VFQk4OCAzpDZ4zqZNNUVn/+fqMaAtlRICgW5QP8ZqCvRET9Q
         I4VNvpMrjXbO/TPcrMaalaHXrte1Ptbhg/hmnv3CCriFbbQtZX5C2UNmoDgdY7K5kiSw
         LbUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d+k3Ml8dy+ZiyZRYJ1dHv36rs8wSqODj2cIfkPfKU5U=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=JHNhB3KtycveRyIH4+zDyKsQpwj9HKN9ZfI+Rn+qQllymjTKRlG8NlmsB5CPdqxon5
         UYCMUFuI/uN64pP0iW8KmqEu5TGdGJh3GCCvQQ4H6btAyP7cCmOfQkf+NUfcI05+E/Cg
         uagCfwH5CP92WSeLEse4Uq1iVFvsmNwm1fWqb7WoxyqS7+0+6P3l7GZVEWQtAXzMNEbT
         w65wa//880AVGNB8wXqzllLVH/dl7uhBFOpTJhPqXO8BAokDc+6K+135TQcln0NTxLHy
         k9MMmmq8opH97kwqAybS2pp5NnTz/noDO8C6DxfkzaXakUed5XQQ7uvrk416iKNNKb/f
         9IZw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781844650; x=1782449450; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+k3Ml8dy+ZiyZRYJ1dHv36rs8wSqODj2cIfkPfKU5U=;
        b=sY9dAJLP+hPpsqQd6nMPWWNEfv1L9gCWEaqMq77XklWILS+2kQKLfLVxSJHa3XJosp
         DWN9LYNikTvYHOxMfSJ54aQlKRJyldcSWCeEktLVnNe2yuxJVAz5jaMFF/jS5d5jXWD0
         wRxPDrtcCRR2jhXuK3nwFx9iEQcvyBiDc86Kxux+UJqiqANMLuGRDD9NUCglNZ10yYZZ
         eQlw+/n5BT4S8YQQXK/9kG4xeEhYztK1g6HPrSgCU8qZdgFd2TWeV7FiSgHrfJNq8sv9
         xIyIDRzy7P5CSF2i+ERBbm9SRXdIep06x6WvC8kZPcc6x/Ah3n5AJFyyVS7Ipg+VCC9G
         xdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781844650; x=1782449450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d+k3Ml8dy+ZiyZRYJ1dHv36rs8wSqODj2cIfkPfKU5U=;
        b=swRxXWjWGTMKgQlKDhwDiAU1MM464qke4AZ1ZlGGbvugx0fV4bGxRpZjSgknmqD+S8
         ehoRDtkwWYwhlse105MBEPtpXwbgDJ1FrpmAeR/v2ut76F2qeHY9upGq5hhjOrkPW235
         dDwfYlUoXPS7Ot38WtmVKt/QIjKLvGyFlWFUGS8zVZN8x8suwaPQXqnms9S8j9uzXqz3
         iZEmcd4oZm0KqgaULoMh6YB5j1brvria1ojUUbvulNunqAr9QZrTmdzTchD+4B7DqY+V
         mV7GTcVbKX0t/qvzgbryYgnNKLCmn5Zv50cR5wU/IQfj7Ggo/4n3OKRzO/MO03US1Shd
         5aDg==
X-Gm-Message-State: AOJu0Yxo0e3RLZ66mw1urcU8mircoxNaTMkexCtNjxhRU1fpVP7bHUKj
	/hmWA/HkDO9Y1nks8MPcR8yHV0JMbSYohgqqtqjnGprhaW+z/KzA0r6ezOtCIwSARjhpXxA9oe1
	moCWT2xJPrjBPmet2tiidSOndP2tzbjgIHw==
X-Gm-Gg: AfdE7cmyb62sHJmMovindaeYs2HY7cNrrOwIKcShUaLi9kCYlkIn4p+BaQ0gLNqEbFN
	wj19eGVfiCH6CSk/Zu1u7kS99phDNuCBGsySuweRO8gymiQ0cCs7hwuQcO9D5dGRetkXyo0oxwl
	gNye0DNoSbUhwJW/wqcczqDm+mIzykeV31VNnIxOel2u43M26lDl7jU80ugyBg+k9tI7IwrlEWt
	I1+wmW9wdghnfDobFcQa+D1/0t1T9kbzl1phF/YN/eYHGqrGtZDE7Haln6B/p5wiFFBZSti
X-Received: by 2002:a05:690e:439a:b0:662:d8cc:6b2e with SMTP id
 956f58d0204a3-662fc7b38f5mr1923340d50.13.1781844650545; Thu, 18 Jun 2026
 21:50:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618221919.2919512-1-ameryhung@gmail.com> <20260618221919.2919512-2-ameryhung@gmail.com>
 <20260618222630.755041F000E9@smtp.kernel.org>
In-Reply-To: <20260618222630.755041F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Thu, 18 Jun 2026 21:50:39 -0700
X-Gm-Features: AVVi8CerEGxHtpg1VD1XQFUvmiV4L4zG6EXOJKqow8re4F7R7uFQtG0K1PS22Ss
Message-ID: <CAMB2axNic+A2QzV8e7B6o9frcMm50nq1QDzU+ME_FnuBvGdy=w@mail.gmail.com>
Subject: Re: [PATCH bpf v1 2/2] selftests/bpf: Test cgroup link replace with BPF_F_PREORDER
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 3:26=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Missing error code propagation on `bpf_link_create` failures c=
auses the test function to incorrectly return success.
> --
>
> commit 5273c7a6df31aa862a2601f91f12e4d696020f49
> Author: Amery Hung <ameryhung@gmail.com>
>
> selftests/bpf: Test cgroup link replace with BPF_F_PREORDER
>
> This commit adds a cgroup_preorder test case that attaches both a normal
> and a BPF_F_PREORDER program to a cgroup. It then replaces the normal
> link's program via bpf_link_update() to verify the effective order change=
s
> correctly without array corruption.
>
> > diff --git a/tools/testing/selftests/bpf/prog_tests/cgroup_preorder.c b=
/tools/testing/selftests/bpf/prog_tests/cgroup_preorder.c
> > index d4d583872fa26..80a17203c4fd5 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/cgroup_preorder.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/cgroup_preorder.c
>
> [ ... ]
>
> > @@ -102,6 +102,75 @@ static int run_getsockopt_test(int cg_parent, int =
cg_child, int sock_fd, bool al
> > +static int run_link_replace_test(int cgroup_fd, int sock_fd)
> > +{
> > +     LIBBPF_OPTS(bpf_link_create_opts, create_opts);
> > +     struct cgroup_preorder *skel =3D NULL;
> > +     int normal_link =3D -1, preorder_link =3D -1;
> > +     int atype, err =3D 0;
> > +     __u8 *result, buf =3D 0x00;
> > +     socklen_t optlen =3D 1;
> > +
> > +     skel =3D cgroup_preorder__open_and_load();
> > +     if (!ASSERT_OK_PTR(skel, "cgroup_preorder__open_and_load"))
> > +             return -1;
> > +
> > +     err =3D setsockopt(sock_fd, SOL_IP, IP_TOS, &buf, 1);
> > +     if (!ASSERT_OK(err, "setsockopt"))
> > +             goto close_skel;
> > +
> > +     atype =3D bpf_program__expected_attach_type(skel->progs.child);
> > +
> > +     create_opts.flags =3D 0;
> > +     normal_link =3D bpf_link_create(bpf_program__fd(skel->progs.child=
),
> > +                                   cgroup_fd, atype, &create_opts);
> > +     if (!ASSERT_GE(normal_link, 0, "create_normal_link"))
> > +             goto close_skel;
>
> [Severity: Medium]
> Will run_link_replace_test() incorrectly return success if this first
> bpf_link_create() fails?
>
> The err variable is 0 here from the previously successful setsockopt() ca=
ll.
> If normal_link fails, we jump to close_skel and return err, causing the
> caller's ASSERT_OK() check to see a successful test run despite the failu=
re.
>
> > +
> > +     create_opts.flags =3D BPF_F_PREORDER;
> > +     preorder_link =3D bpf_link_create(bpf_program__fd(skel->progs.chi=
ld_2),
> > +                                     cgroup_fd, atype, &create_opts);
> > +     if (!ASSERT_GE(preorder_link, 0, "create_preorder_link"))
> > +             goto close_links;
>
> [Severity: Medium]
> Similarly, should err be set to a negative value before jumping to
> close_links if this second bpf_link_create() fails?

Right. Both error propagation are missing. Will fix.

>
> > +
> > +     result =3D skel->bss->result;
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618221919.29=
19512-1-ameryhung@gmail.com?part=3D2
