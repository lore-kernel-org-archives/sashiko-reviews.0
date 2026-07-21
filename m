Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA1F3346A6
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 17:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784655655; cv=pass; b=i/Nlyog4d1UDv66NJgMBn/sL8wrVPPi/wgB+5pDTF4LKldjvUMH7G2pMgcS9iflodgvAzmAW8zDCUJJFfMc5vrffrzVpYOe0Ykg4wjhZAPGWJHvksTYMdU+WqIof363Rw6RXPACv52z1APU5CUE8uGb3AOJnHr6sy5N8TMY9jiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784655655; c=relaxed/simple;
	bh=jcij0a0bdJCJHImpik/mNjjxwB9JULp6Ljj+hpCdPzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CBfVGDf+QVEe8zUCA9cHixO+AgKVkiLr7eOt5fyTkAMKS+6v2HdMJVPbE6J5rVl4iriL4KcDAwFkX8GAOzdCAbtohm72ZEAN9883bgeKl9JVr4Q+mtQywJamNgWyqR4Jo6S0GmpjOZ4cpb+k7B/D3upnta6AzsvkTLWFtP+elCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4+XlBAF; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4+XlBAF"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-668432d50b0so3721868d50.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 10:40:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784655652; cv=none;
        d=google.com; s=arc-20260327;
        b=LpbSfKYArEkqaSpbpBwki6dd/ZjQjH4Un2I853euK7iCO9ljxE0LQ4DaLRh27iYeOC
         OojN0yfoJA/FHP8o6CqGzSQs5oJCWXkS0oxxIezxlXjurGz676aVqgnBKrDYDWTGOW8D
         0rjOX8O+zP3n4ZZCKfRGjnfTfRJnpZhnp/mTcduAI5uBG8YJWwRJS/aKyVhvZ/NnpjwM
         EBroCLjl5YjzdyoO/9JJchU+sHx4z/ps0X8SKYosptcjGQ6UVzPPGQL8nUeGFTaFP3gb
         ZKAYAchR0WZhpQsTdP132/seScgqsE6dD/3HuPI6QOK7RAEoak+Ofd4LG5cyooApcJYm
         THgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9almTHjFbfDOI+RxAOp6GPttHl5pp39q475h1J3QeVo=;
        fh=FAs+oqBvp4uRcgatxImXh00rwjhwEgInskW7+NhMwNA=;
        b=NYNgBOokkaLO/+KPABPcz+zIqGTyThk/88b9Ef/sF2TPXCOAga1QIXUtb02Mp7u2jA
         q/TaFENwzc7aThcZRRcOKqmUr2g8vXLtHorDtaDagiL5yb7BYR8oU5PBbalmWZJCGrXZ
         3YAvuBflKDZDJWPkKLmIfDFb4HPRe073Zbih9vyMJlirQsy4Z2KZv/+61EFKLao30FR1
         HEROlWqeVEoFXm3HTXhbpslH+CqKI8JYz7w5bety3vVowvuQ5asYeVrn6SyWFc9nGafm
         FUZbIdfiuBkBTQ36rT4UlnnWwJdm/dZb4exjWFJI4LA/4GKsIkwsgSVPw4CnEkU2NdvW
         OLIQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784655652; x=1785260452; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9almTHjFbfDOI+RxAOp6GPttHl5pp39q475h1J3QeVo=;
        b=j4+XlBAF7MESQCh+FIY4Ug2qIjSYHA43+7/RmpSwF9Pw7xyDMw0zAXuHRxX39Q0FBz
         c0YOFF5QfZorzEMqXYQD5PEuMnBPeHCAAfnRir4Sgkxzmah8bMkxfa0CAxrDAlHk2Zil
         pp4+ia9mbq2weAsBtIDxzpbhH29CfDkYg96elc9BQ0z46DXAv5S+WKD2onG0uHQe4vdQ
         MTfhQMqjh9NbA6TUprJjTtmJCIq+ZpN1ATKgdrWbaqptuVGRXGOMoP1gzHs/RsWEllxQ
         qPZo5UkEt6VwBmyn91GLRsV5PUtMs61BzDeo0ZJTrGb29xIny4MgJQKIbuWW1tnTtUlW
         s1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784655652; x=1785260452;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9almTHjFbfDOI+RxAOp6GPttHl5pp39q475h1J3QeVo=;
        b=ruUb3ZzPIvvKZtX7mUekO6Z4oMJi8JPlUhDVoMS2N0ZMmkuUfM0/VU/bN7UOfHleW7
         ZrixYk0qBeVJLzLNthczFgxmc/0IyIuoBn8MLi7CL7m0hHk/ozVXUebffe6Jr9qLAxWX
         Pu9UchKE5QbMNoz5wxw9+slGxns3GoeEvWVhB7XfhAAxfKUeR/r5pnxVcGkn8oSMuIqS
         Hj6Sbj5/vbw0QcLt1EQ57GpvAz8PSIS2bh/1FrPsAGOhMqMslgkA/yWRgyENb3y/xEQ3
         NmQLLXV5Ep4eWXTV4Xnlio/cbJGQirNgFjCKf/ZHb8Gh24qghMYrHaRUEkmYTavnSJ6P
         KDTQ==
X-Gm-Message-State: AOJu0YwyK7XWWQhfM6POX75zqDmYC8EazMaTx/24ZRPYVAkixA92UqRm
	uruMQ3+gZYA3aogaeG42AcNu381W07+JUCALWh/02DXnJ0pWXyESsa4X1OTo4iuuQWQi72s6Xk5
	vAWNQ0gU1WbI2Xq/p3rLSRmNLq5JnVqyvNRFa
X-Gm-Gg: AR+sD13/NeAuBLjh1WgFDQOwfBcL1jvhBlRZhULlcIyDwROfca4Pig2llXj/PV5Ud3f
	lGtvgdSx8yHk2wtjJCAhifNszZlGtYtXWpRUwDT7WiJbmWYSTjscQlX5wkDkFUESW9vOEC6+1BF
	Hq2y9WHi8BhQteSWvsw0jPiHBadyAr3bNDTsjkReWuc4OHmOJFAG/rNC+6Q9doa1JOQYe6Dojga
	3G0upTa8lkC3mZ2NIo4I4YE6ygP+ivaPOGMNESieXoW8qei2fNWtyGttWdlqUi2vGICfP/q
X-Received: by 2002:a05:690c:4c0f:b0:81d:78e2:2a8b with SMTP id
 00721157ae682-81ef2736942mr63499637b3.7.1784655652574; Tue, 21 Jul 2026
 10:40:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721041048.1394085-1-pulehui@huaweicloud.com>
 <20260721041048.1394085-3-pulehui@huaweicloud.com> <20260721042151.E6F941F000E9@smtp.kernel.org>
 <723495f2-f4a0-4723-90a8-d4774e6dce05@huaweicloud.com>
In-Reply-To: <723495f2-f4a0-4723-90a8-d4774e6dce05@huaweicloud.com>
From: Amery Hung <ameryhung@gmail.com>
Date: Tue, 21 Jul 2026 10:40:41 -0700
X-Gm-Features: AUfX_myeOPuVGwDAlQRpaJu1g5jzmOaSvCbqogymasHlCTogZaZlynSes9d40bM
Message-ID: <CAMB2axMocV3+cC8O5LEu-0bPcGvchwjASbjM_afx=Stc_8AvKw@mail.gmail.com>
Subject: Re: [PATCH bpf v5 2/4] bpf: Fix UAF due to missing link type check in mprog
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 2:18=E2=80=AFAM Pu Lehui <pulehui@huaweicloud.com> =
wrote:
>
>
> On 2026/7/21 12:21, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Medium] Anchor link type validation is bypassed when attaching or de=
taching bare BPF programs, leading to wildcard insertions/deletions and dat=
a races.
> > --
> >
> > --- Patch [2]: [PATCH bpf v5 2/4] bpf: Fix UAF due to missing link type=
 check in mprog ---
> > commit 830a4e62ebb8e98cc45b0ce829c6686aacafabc4
> > Author: Pu Lehui <pulehui@huawei.com>
> > Subject: bpf: Fix UAF due to missing link type check in mprog
> >
> > This commit adds a link type validation in bpf_mprog_link() to prevent =
a
> > use-after-free when dereferencing link->prog for foreign anchors. It al=
so
> > adjusts bpf_mprog_attach() and bpf_mprog_detach() to pass down the expe=
cted
> > link type.
> >
> >> diff --git a/kernel/bpf/mprog.c b/kernel/bpf/mprog.c
> >> index 1394168062e85..37ce91e0bcd21 100644
> >> --- a/kernel/bpf/mprog.c
> >> +++ b/kernel/bpf/mprog.c
> >> @@ -17,7 +17,7 @@ static int bpf_mprog_link(struct bpf_tuple *tuple,
> >>              link =3D bpf_link_get_from_fd(id_or_fd);
> >>      if (IS_ERR(link))
> >>              return PTR_ERR(link);
> >> -    if (type && link->prog->type !=3D type) {
> >> +    if (type && link->type !=3D type) {
> >>              bpf_link_put(link);
> >>              return -EINVAL;
> >>      }
> >
> > [ ... ]
> >
> >> @@ -243,6 +244,7 @@ int bpf_mprog_attach(struct bpf_mprog_entry *entry=
,
> >>              return -EEXIST;
> >>      ret =3D bpf_mprog_tuple_relative(&rtuple, id_or_fd,
> >>                                     flags & ~BPF_F_REPLACE,
> >> +                                   link ? link->type : BPF_LINK_TYPE_=
UNSPEC,
> >>                                     prog_new->type);
> >>      if (ret)
> >
> > [Severity: Medium]
> > When attaching a bare BPF program, link is NULL. This passes
> > BPF_LINK_TYPE_UNSPEC (0) to bpf_mprog_tuple_relative() as the expected
> > anchor link type.
>
> Ah, so when attaching a bare prog with a relative link, having the
> BPF_F_LINK flag set means the relative id_or_fd is a link, not the
> object being attached. Sorry, that definitely confused me.
>
> >
> > In bpf_mprog_link() above, the validation check is:
> >
> >      if (type && link->type !=3D type) {
> >
> > Because type is 0, the validation is bypassed entirely.
> >
> > If a user passes a foreign link with a NULL prog (like struct_ops) as a=
n
> > anchor via id_or_fd, the positioning logic treats tuple->prog =3D=3D NU=
LL as
> > 'no anchor provided' instead of rejecting the invalid anchor with -EINV=
AL.
> >
> > Does this allow wildcard insertions or deletions, and leave a benign da=
ta
> > race when reading link->prog locklessly? Should the expected link type =
be
> > explicitly provided when attaching bare programs?

I also overlooked this. Make sense to pass the expected link type from
callers of bpf_mprog_attach().

> >
> > [ ... ]
> >
> >> @@ -343,6 +345,7 @@ int bpf_mprog_detach(struct bpf_mprog_entry *entry=
,
> >>      if (!bpf_mprog_total(entry))
> >>              return -ENOENT;
> >>      ret =3D bpf_mprog_tuple_relative(&rtuple, id_or_fd, flags,
> >> +                                   link ? link->type : BPF_LINK_TYPE_=
UNSPEC,
> >>                                     prog ? prog->type :
> >>                                     BPF_PROG_TYPE_UNSPEC);
> >>      if (ret)
> >
> > [Severity: Medium]
> > Similarly, when detaching a bare BPF program, link is NULL. This also
> > passes BPF_LINK_TYPE_UNSPEC as the expected link type.
> >
> > Does this bypass the new validation and allow wildcard deletions when u=
sing
> > foreign anchors?
> >
>
>
