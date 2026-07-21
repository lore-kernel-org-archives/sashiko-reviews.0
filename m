Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7882135AD
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 18:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784659217; cv=none; b=ow/0FgM2UWY3aG4BQt+dXebFeui3N4UbMsRWKigdqTLTPGOIrc/ezDIIlYhHfH1hwLzQN/JP1f7DjhO7dJ1eJRiW0cckNUNGckVf1pjksIQLCbOMynJ9lpgGUak3uUd0HKl32RC+tPeriGNx89W8/n8X5pYgGB/W0i6wa/b00pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784659217; c=relaxed/simple;
	bh=CEHCZS1G5Y42WECDRP5LrS/sZ+WH6FFxldqOA5Qzf7I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=MqoXqdg/5vpVHFGAB0O/RPz5BQSUoU9fclGo+fVJQqjgOeM2vgq/fw+ZQBw/mDHo0tXNzBmN98PRKse2hHEoTWfcIb5vajaWTxFYlOiNsnBd55U/gLbVMRPpsz0pd/cK2qxji1zLdgT6P0kklwjHp3b53b9EBUVQhgoXCdWxK9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=rQqi/Z9y; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="rQqi/Z9y"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so7363513a12.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 11:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1784659215; x=1785264015; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cXucJmocQuo7Hb1xWA0bWNA+TKY00q86yxvGHTwRRPk=;
        b=rQqi/Z9yJumkK37dchJKDYMvXr27aAAgKgh6ihlurHdyc1sFBVH+kAVzxfavbQgPDz
         cOIHggo3A+ue9R7q059T9K2aJ9FTuX6Bv4lqvIiwF9EdJvcbnoR4PJt/VnM0vVIAXmZ6
         J31p7wkDMWSm9R2cN4nLZNcBh1VdJhHjzo6CKngeKbSukv7eQ8f7BdYM9zFaXgYWe3Cp
         BW4epq6jinhUcxMYTSCTEOs0ZkdQEhM83c4trCbJqUEiPnYgTNVP7+G7C+Sd3veF1OPh
         7oOhBtVo5mTm4a5TpsW/O1W+bl4a6jL1WMZyIhaFPqo2dA1BCvBLMXhZcIunLGChanR7
         dLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784659215; x=1785264015;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cXucJmocQuo7Hb1xWA0bWNA+TKY00q86yxvGHTwRRPk=;
        b=lEaANUNTQ9w0vgpNGzbWEnSdOO6nBUcUmr2cUEWCTlU67dRNe9O59jADCfXDs+Lc9r
         Dhgas9yxvTqlWKV18Cta8j1r4yH/77ihs1T1YmE5TeYKx87pSZ5RLyAWlyYo80RQjTaR
         IA7B7+z3T4qbEJJEIC9d0+mzn0pEu2Xve3BQQVp7NYeUUX4ywhWQMFjB0cmwTwm0fxNs
         6S4xnAwmhaNOJRTpgTxRG2HYHRPGx3Rw/SiDkYz/+R5wjXdMuWp960o+mL5hfGH16lmI
         oCuom3YJLIbNTIjSlJSQGZ/ZOpoiMbhKgjWy22hFjFZhoUeb+gh85qvkbP4OyS5zq8mk
         O3Qg==
X-Gm-Message-State: AOJu0YyLc3JERrJN9QGXx28pQc7oBCTxEKrOrhZ6sJvim68vfgmAWB62
	ZSXzOi7mL9nYKN70VjNEwx9chpErRyp6aQGcqm/P4VOiWbtK1yQD9NTjMvL9qS9O1k4=
X-Gm-Gg: AR+sD12iEDVg27E2+zDbTyHIuQk+25EUm1iLVHtU8FA2sLY/3Z67wh0eey4CI7+y+7f
	kwaxES40571cDHVNkmUJgswBVjGCIZitOvZ59+pVd6Sq8rN3aFqqdm+5Xq1TqipxhTOYf+Eg9j6
	AMkzjNt+RapAQTJHVPsOwIm7W+72Nl0GnOTuIOdnCfu8sucKZANf/9Fx+JTAs3L12SSXbnhWhQ/
	bPHP8qhS2bNOTHsLJlgvM9jjf8yyskZaLq2exCPrduvbgM9dofj0xuSjglzLMGE01W5yGEvNKZ5
	6Z6u5xTOotE1+KrVDAGpdrpQ+tYBF20dckB6lvahAi18pd8e5Jqzp3N1xydGHL9g5Fx6raugap3
	q/wjaBGcQlq2AR57qRFpqjq2j8fIYmLOcqbbHmw+ZdcgbaNtGawq90sy2uJk=
X-Received: by 2002:a05:6a20:2583:b0:3c3:9595:57ef with SMTP id adf61e73a8af0-3c3ad7781b3mr18749954637.31.1784659215324;
        Tue, 21 Jul 2026 11:40:15 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::4a7b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a129f3sm39641494c88.7.2026.07.21.11.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 11:40:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Jul 2026 14:40:13 -0400
Message-Id: <DK4GW4BH8RPS.32N0A91SQGMOH@etsalapatis.com>
Cc: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf v5 2/4] bpf: Fix UAF due to missing link type check
 in mprog
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Amery Hung" <ameryhung@gmail.com>, "Pu Lehui" <pulehui@huaweicloud.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260721041048.1394085-1-pulehui@huaweicloud.com>
 <20260721041048.1394085-3-pulehui@huaweicloud.com>
 <20260721042151.E6F941F000E9@smtp.kernel.org>
 <723495f2-f4a0-4723-90a8-d4774e6dce05@huaweicloud.com>
 <CAMB2axMocV3+cC8O5LEu-0bPcGvchwjASbjM_afx=Stc_8AvKw@mail.gmail.com>
In-Reply-To: <CAMB2axMocV3+cC8O5LEu-0bPcGvchwjASbjM_afx=Stc_8AvKw@mail.gmail.com>

On Tue Jul 21, 2026 at 1:40 PM EDT, Amery Hung wrote:
> On Tue, Jul 21, 2026 at 2:18=E2=80=AFAM Pu Lehui <pulehui@huaweicloud.com=
> wrote:
>>
>>
>> On 2026/7/21 12:21, sashiko-bot@kernel.org wrote:
>> > Thank you for your contribution! Sashiko AI review found 1 potential i=
ssue(s) to consider:
>> > - [Medium] Anchor link type validation is bypassed when attaching or d=
etaching bare BPF programs, leading to wildcard insertions/deletions and da=
ta races.
>> > --
>> >
>> > --- Patch [2]: [PATCH bpf v5 2/4] bpf: Fix UAF due to missing link typ=
e check in mprog ---
>> > commit 830a4e62ebb8e98cc45b0ce829c6686aacafabc4
>> > Author: Pu Lehui <pulehui@huawei.com>
>> > Subject: bpf: Fix UAF due to missing link type check in mprog
>> >
>> > This commit adds a link type validation in bpf_mprog_link() to prevent=
 a
>> > use-after-free when dereferencing link->prog for foreign anchors. It a=
lso
>> > adjusts bpf_mprog_attach() and bpf_mprog_detach() to pass down the exp=
ected
>> > link type.
>> >
>> >> diff --git a/kernel/bpf/mprog.c b/kernel/bpf/mprog.c
>> >> index 1394168062e85..37ce91e0bcd21 100644
>> >> --- a/kernel/bpf/mprog.c
>> >> +++ b/kernel/bpf/mprog.c
>> >> @@ -17,7 +17,7 @@ static int bpf_mprog_link(struct bpf_tuple *tuple,
>> >>              link =3D bpf_link_get_from_fd(id_or_fd);
>> >>      if (IS_ERR(link))
>> >>              return PTR_ERR(link);
>> >> -    if (type && link->prog->type !=3D type) {
>> >> +    if (type && link->type !=3D type) {
>> >>              bpf_link_put(link);
>> >>              return -EINVAL;
>> >>      }
>> >
>> > [ ... ]
>> >
>> >> @@ -243,6 +244,7 @@ int bpf_mprog_attach(struct bpf_mprog_entry *entr=
y,
>> >>              return -EEXIST;
>> >>      ret =3D bpf_mprog_tuple_relative(&rtuple, id_or_fd,
>> >>                                     flags & ~BPF_F_REPLACE,
>> >> +                                   link ? link->type : BPF_LINK_TYPE=
_UNSPEC,
>> >>                                     prog_new->type);
>> >>      if (ret)
>> >
>> > [Severity: Medium]
>> > When attaching a bare BPF program, link is NULL. This passes
>> > BPF_LINK_TYPE_UNSPEC (0) to bpf_mprog_tuple_relative() as the expected
>> > anchor link type.
>>
>> Ah, so when attaching a bare prog with a relative link, having the
>> BPF_F_LINK flag set means the relative id_or_fd is a link, not the
>> object being attached. Sorry, that definitely confused me.
>>
>> >
>> > In bpf_mprog_link() above, the validation check is:
>> >
>> >      if (type && link->type !=3D type) {
>> >
>> > Because type is 0, the validation is bypassed entirely.
>> >
>> > If a user passes a foreign link with a NULL prog (like struct_ops) as =
an
>> > anchor via id_or_fd, the positioning logic treats tuple->prog =3D=3D N=
ULL as
>> > 'no anchor provided' instead of rejecting the invalid anchor with -EIN=
VAL.
>> >
>> > Does this allow wildcard insertions or deletions, and leave a benign d=
ata
>> > race when reading link->prog locklessly? Should the expected link type=
 be
>> > explicitly provided when attaching bare programs?
>
> I also overlooked this. Make sense to pass the expected link type from
> callers of bpf_mprog_attach().

+1 on this, and can we add a comment that ptype =3D=3D UNSPEC is because
detach() uses this as a wildcard? UNSPEC is only valid in very few
places in the subsystem.

>
>> >
>> > [ ... ]
>> >
>> >> @@ -343,6 +345,7 @@ int bpf_mprog_detach(struct bpf_mprog_entry *entr=
y,
>> >>      if (!bpf_mprog_total(entry))
>> >>              return -ENOENT;
>> >>      ret =3D bpf_mprog_tuple_relative(&rtuple, id_or_fd, flags,
>> >> +                                   link ? link->type : BPF_LINK_TYPE=
_UNSPEC,
>> >>                                     prog ? prog->type :
>> >>                                     BPF_PROG_TYPE_UNSPEC);
>> >>      if (ret)
>> >
>> > [Severity: Medium]
>> > Similarly, when detaching a bare BPF program, link is NULL. This also
>> > passes BPF_LINK_TYPE_UNSPEC as the expected link type.
>> >
>> > Does this bypass the new validation and allow wildcard deletions when =
using
>> > foreign anchors?
>> >
>>
>>

