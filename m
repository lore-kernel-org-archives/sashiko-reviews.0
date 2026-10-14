Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2039C4DD3B8
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 09:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971827; cv=pass; b=heQkX8T/GeYlSlw9WOy13UAf5WumzP3h3W0O7zyHTsYFgOOunExnq41IBoxrI3U5yOcou42TvD7pZ1H4rLVliemEM+vZWh2BOJdr6tg5jGtlHOLMVi9b5UkuWDwuVt6e9BgfpasaKh1aymhVty1tTWZq4HKrrEEB0zCgSteVXP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971827; c=relaxed/simple;
	bh=pES0DDjBr7lNbZcv4EttsrEqsZlgoprgnuuUAEr6uzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rn7gki1VJqS3v4h7jBN/oSd4WDdg157rkW67++4wf4Wk2mA43HorxioocPJqMwvsVwddwjnH233cjXSK/UnrPcu9qM+SETIAh/XeY+tbNvaw9BwegxkgnN311gUm658IHpYlO/7r1awELVXYUk5UmfyFzHZqycd0C2iyg0LszkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=uoNoc0fq; arc=pass smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="uoNoc0fq"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-873a4edb243so219987b3a.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 02:57:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791971824; cv=none;
        d=google.com; s=arc-20260327;
        b=VJ/e4fPAc+U4xewZDYD9zGy2H8/Ae9jzyGXl0giLp1MKi6KSEo+82MsPgeq/769Q1b
         mtQ1K77ZqzBhWPxVNQcc15w3F7sh3JPwNZBGvICcdJsE5T1HIut34XdbGl7Z+8amHuV7
         EPHNcd31utm01PEmFlwPFvnGLVKrlf0Nhce9QQJQyfChua74r/GxXuFRIlMFb0bMrBKf
         Lo2zDbHQH8qRz2eRbNfMVK9+klamPcdO3wS6v8Tftd6pwiVl+cYBQnPAbDT/cn/ujM7M
         nc0lQk4nUvQ67TCBJ4nODUeISw+EaUAXbl3mxcyGWKaoDhzejGvMFYooudOvkQnbu6+V
         FVPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x9rvRSpojIVM87li0yF5q9R69waCFTVPzWFGm69CD+o=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=QYtYC1RA50O4g7BblFjc4JGIYDW3m/ya38NgwQcrjBfThkwBL0Z3kx+39NegXww3ga
         BvCMYPUYl+2fBNILqeVKWPZvb2CYaDv2TNCfAY1Jf88xZkbY3LSTr97JZA/SNCDlSlws
         RTau+JG9FtQpGF2riZB9MwwBXp27OE5vQCzXZEZ5XvMjkTr/IltUyGtXqtrfb3ihO93y
         689hs2cUJMgDtJN4VLt2bYanLyOiukB/iFbo35nI6BeNoXZmUTMPd5kc8fXA3DRkfDJE
         lj1WlRNqlrO59k7StPpo3jlwb/LWRnH7wtbcLLcvi587jDCA0qqnTD8gO7IkhkitKJyN
         MbnA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1791971824; x=1792576624; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x9rvRSpojIVM87li0yF5q9R69waCFTVPzWFGm69CD+o=;
        b=uoNoc0fqYUrg0HjGrIU7Uj7hIWlQROJU3Qtn1G1oJTar4QRPZmzfCX9+fm9D7rQVTv
         JTuoai7cC55j07BHEL6YVAWPksgP9pa8d2g7EeHx9SXJKEXcz6H4SsV2IjmJnnXATeFv
         HdKHjQEGrP3mg1OjSZGKFn4XoDYjgOtJ1yqrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791971824; x=1792576624;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9rvRSpojIVM87li0yF5q9R69waCFTVPzWFGm69CD+o=;
        b=GMyAX/V9mSurzIKbRyNKxP7m4tjNpp9ew+GjNA7pn+g2wJIwLl9yXVd4rgmzRseVXr
         sALRWq/8xhDYq7e2vTyYnhShhHzoLqJkF1sHiMcrU2Q1tiPuSzSzXqVqw5SseYQnlsdy
         uhMbC6sdWpqMXRJejXgIJnFs42cy+aaPZAsUzYVzJ2jC4CtdN9UsID292E/xKXNGVWqH
         qu0LjbSfnuqT+4ycQNe+K2d/h9+90mMNlXoK1mWKQO0a/WeVgy6tj7E5VoQrOJ8hWkzr
         YsxBEwB2WtI0ZoTwX9OgTJYFPxnWwdyij8L+KLZNUXeO1heWLp33CvGT7A40CoQzigUK
         ofKg==
X-Gm-Message-State: AFq9FYLTtUu4LX4krJO3cTQ1D2tNPq17tN4Ti7ONpFEuG1MNjEDhSAjb
	Rnofp4XV/+DOggMu9VLLpNM3lMOnmur/Rh/DqdThn75Bsv6Gkk9JgXAHiD1cK5FMVro1LTISllw
	LsbSX6/0zLbLc+zNq6WaEnICvzv7XWx3diEs8MJcOWd8E+B8Y9I8=
X-Gm-Gg: AYBFou1HOUzl/j89x80Nz0iYo47oUAPjPCqNyji++mCXpzFdmDoBmafv73OIBrMV94m
	qTKUq1ITU1KZxHxzAu3GL+SCAgPwVSbtG1WxPwHTp58V1eATrGUPSw3SMd5cqvqPrjxlVaYjijp
	y5xC550NsodhkHc3JcOkEQGyQ+OG85iL29FqWHVoDXLJgD8JiXpssJ7uBqf3z7er+9eN9PUMLk8
	99scUKeeGt1mIf7YpICSXDELY4gjoJ3VBQHBa8/PGSYq35lCN0mRb/7PRxiAoTarLtt8IiqXjrI
	xn/9RaZtUbjwcTbxhy6nIfwuCNh9ZzHBPmwOpSYC6s2RinyhR9yfPmAeqTHHNA28zNns7Q8RygD
	z6c4dTnvH869ibvEmEeSjkMmsn+8Js0PNuA==
X-Received: by 2002:a05:6a00:3e12:b0:883:71f6:5fb with SMTP id
 d2e1a72fcca58-897c6e1b608mr14580422b3a.13.1791971824324; Wed, 14 Oct 2026
 02:57:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <QDISC-H19Z.v3.r0.20261012193813@mojatatu.com> <QDISC-H19Z.v3.r0.20261012193813-1@mojatatu.com>
 <sashiko-outbox-171044@kernel.org>
In-Reply-To: <sashiko-outbox-171044@kernel.org>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Wed, 14 Oct 2026 05:56:53 -0400
X-Gm-Features: AclHuK-NLE3qfsWeit2n79z3ZCol8KGxRxDpPaAT__Uoa9Kdg3NPnm2-yKHy-cg
Message-ID: <CAM0EoMnwMw-tOJWp19WWwrmkxivYQ0iYaZRgkOZmndn0hA3szw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/5] net/sched: act_gate: reject oversized
 dumps instead of wrapping them
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 4:54=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] net/sched: missing error propagation and wrong extack in tcf_get_=
notify
> --


I will not make this change unless something more substantial shows up
in othre reviews.


cheers,
jamal
> commit 98a2c073503c58fa744586844b669ba5ddd1bfc0
> Author: Jamal Hadi Salim <jhs@mojatatu.com>
>
> net/sched: act_gate: reject oversized dumps instead of wrapping them
>
> This commit fixes an issue where oversized action dumps wrap their u16 ne=
st
> lengths, resulting in structurally corrupt netlink messages. It uses
> nla_nest_end_safe() to report -EMSGSIZE instead, preventing unrepresentab=
le
> dumps from vetoing deletes and allowing correct handling.
>
> Link: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260824153903.=
4143642-1-victor@mojatatu.com
> Link: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/QDISC-H19Z.v2.2=
0261007062551%40mojatatu.com
> Link: https://lore.kernel.org/netdev/QDISC-H19Z.v2.20261007062551@mojatat=
u.com/
> Link: https://lore.kernel.org/netdev/QDISC-H19Z.v1.20261001053234@mojatat=
u.com/
> Link: https://lore.kernel.org/netdev/179111893181.434549.1344966067026704=
8994@kernel.org/
>
> > diff --git a/net/sched/act_api.c b/net/sched/act_api.c
> > index 6e48b4bc2d75d..4b4b5d37d2206 100644
> > --- a/net/sched/act_api.c
> > +++ b/net/sched/act_api.c
>
> [ ... ]
>
> > @@ -1701,7 +1719,7 @@ static int tca_get_fill(struct sk_buff *skb, stru=
ct tc_action *actions[],
> >
> >  out_nlmsg_trim:
> >       nlmsg_trim(skb, b);
> > -     return -1;
> > +     return err;
> >  }
> >
> >  static int
> >  tcf_get_notify(struct net *net, u32 portid, struct nlmsghdr *n,
> >              struct tc_action *actions[], size_t attr_size, int event,
> >              struct netlink_ext_ack *extack)
> >  {
> >       struct sk_buff *skb;
> >
> >       skb =3D alloc_skb(max(attr_size, NLMSG_GOODSIZE), GFP_KERNEL);
> >       if (!skb)
> >               return -ENOBUFS;
> >       if (tca_get_fill(skb, actions, portid, n->nlmsg_seq, 0, event,
> >                        0, 1, NULL) <=3D 0) {
> >               NL_SET_ERR_MSG(extack, "Failed to fill netlink attributes=
 while adding TC action");
> >               kfree_skb(skb);
> >               return -EINVAL;
> >       }
>
> [Severity: Low]
> Since tca_get_fill() now returns actual error codes like -EMSGSIZE instea=
d of
> just -1, shouldn't tcf_get_notify() also be updated to propagate these er=
rors?
>
> If an oversized RTM_GETACTION request fails with -EMSGSIZE, it appears it
> will incorrectly return -EINVAL to userspace and display an inaccurate
> extack message ("while adding TC action").
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/QDISC-H19Z.v3.r0.=
20261012193813@mojatatu.com?part=3D1
