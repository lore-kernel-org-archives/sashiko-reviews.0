Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49B92E92B3
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 20:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779221652; cv=pass; b=uY2+ivoDdpkhXt7q4XS1+K1y1+tnMgVXNJ1SapbrrakZgTajqyokoZwiYdL7SmBcLtNCcUX5+HTTgNY9efchXrzOdnkQbP6FSfShJW/Z1Or+05RfWHcfdTk+VZjas0DVYdijy/He2nziFVj3QRSFSzrGJEbqH91ulhCsGJnIQYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779221652; c=relaxed/simple;
	bh=l0Hwh+rQk6VbMYcCuvHAesejiXWdL0/E12fRLHc2C3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QVSPcDwpkyjU6PpvMFBJrBrKcfZidg0pPYdPw/bmv8aU9WSABrYhI74LFCyTz+7it5NqHXpRRjDy4cV1vbbGfFFWrs7PiURx0i4HFYB9evKcx5VNGppMrNix+h64O831GUVEYFcX5Lr/VFEZB+IGoaDHTOgBz2YtVlGgRfePAI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isOa9D9/; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isOa9D9/"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7b6ae2ea4a1so37589267b3.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 13:14:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779221650; cv=none;
        d=google.com; s=arc-20240605;
        b=Q1DdjHTAnBngetVs0RD7Uui9fFrbb74WBb8Ws1+rIfgSyu3KvfYiBF/roZOJnaj9xp
         c8vXe71zwSTCmrHqTMoJ4PrNXJuNPUWDVhA2uaE9gzPUiBaikFah9SRdo07n+eMhvhtq
         5qd5D0GWVLGqByhiwJA8DdF4Ib1SPKizuV6xz4bbydJvlvDxvRemgXpZ803KRTaZlFKN
         dJPczi6J4nMxs2KV3g1mKCeUqwHwhZbp3QUYHr87k/H4LrlhDNv7CbzE6bb8IXl863WH
         hpi7+5zX/3idwG0p4tdDSd1qbQvcQclC3F6XtePjdlcNdKTpzHCxDz+Tw4HI/4ZO6LGo
         rf2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3nosRLmHk2ET0pSmZ9ZmsHhZau6rH6IKXdg5ARnOeJQ=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=EUPU4m2cVnOpuhtkfbd91wi9/g0y4vC3BCN/ZDFmJ43hVi3lcaqN9pQQj0HGy+uvuy
         QQ2JNl3q2MC9a501a+7mTvouCwYQr2T7tgM6xigCeBQMODEYs+6coIHsSa5976gduiRg
         0U9W1pakUQ9O+cOi9QvIu5SKnxKhLGZJNwZjw1N0+b3Qsfexnvyvf+GfwwjPSQDoGa0+
         LozWOwsCx4OgBZuOdh3HegATcb0i6mHFPJ1n1HDAxPPm7JS37Z7CRJM9SpSfyaXtt/2T
         BgdOSTLuEhBp/nwq2tsRszYM2K1bLmd8t8/S6s2H6mfI/or/YF/pyAYkal6fbUusnYlO
         bhwQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779221650; x=1779826450; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nosRLmHk2ET0pSmZ9ZmsHhZau6rH6IKXdg5ARnOeJQ=;
        b=isOa9D9/RoooxSDoVAU9cYC7VmiCNc34HCQFteZWSsI9fFywhJjZjFPY9GRjF8Kr3R
         6Z7sEpjQ+aArqdq9hnrhedRi59jKNeE1/fx0XHxrXxRFa+xnAJb+Chk4uC3r0os6g5JP
         xv6OJL78nzedyI+1MGTxCrDxqW5nhUIp1ZNVfn9VS2zUdLawmksAMmwOGNfNy49LVvQ4
         QFEtNbUe14AO0SmhFXLbaIvc74G6I6JJaozvsBKyx+dAnRxAQgQMWUkZckY6MQBw07p8
         DylX8a5eqIhuDje/Dc86Tg46mMpAdmp+qKy1zexa21XnD5iZ0n7ZjktSOHivToDOqA8j
         0aCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779221650; x=1779826450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3nosRLmHk2ET0pSmZ9ZmsHhZau6rH6IKXdg5ARnOeJQ=;
        b=K2RFXP3mvmACbTkS9tI3qXwFlVGUZlV4VtC9ZzuZq0Uly2zikv01W6JVtlLL6jq12C
         8j7SJJwDCExItoc5b6zlDM45Li8+McMs9Rq3edAijAtRFZelRHvo+GbstzsHD0+3p4xm
         FoSJgTS14V5W0c211ifUdtx+vongdNmdg1b/gPYjQRLX99idpiDPAeB9oqgcZDH/eh8b
         jlOu1DEZbzlxayykO3G4aYKQ0wYk+rLMN+TElOeE1gRyR0OWBc7S0z/2n0BMbv7/X0+/
         SOdHkCacrkuy/59yUYchCrZ+fp5DFX11OmbmTQS3+/RUwjZMhULCoZrtvLUsS7ed3AQY
         R+5g==
X-Gm-Message-State: AOJu0YytJSGFiGJhXpY6ahjJNTC/7bpsTM10CPH5IxzUmeMRrY0De6Af
	zEoeOfE1xXRkD5S4pwQwD0bvxJtjLYvx+fF3Nkx/EXeZF+wUjM50zWPOXxErbCR58tJses6EkJd
	JJR1/AlrEDk3QJme9ruusau1fvXUfXmz5cQlY
X-Gm-Gg: Acq92OHvqtkhq5GRhxIN3Sh0UboXshU7hXlBTVDCokXauildEeCT2b8mItmUGK2BleN
	54/XUdPOY69R7Y+xkwHruhpqUHpTgCtg/cDNF1wpjLKdz9QUvzAY33B3Vv/+6lN0HW3NUIrmcJg
	De5VGm/K+2Qlcvcgr5bU5/xyl6ctBxdLsf1yAsLHVVQn3uD+Cc8Un3bpnJfIFEOApqdDT+7MC6G
	JgGwxPKAE1007HwXeeJjkcj17NkDdtb0haPz0Ugpdwbh9UQmPAOVt0/uzGyoxu8uuCN2sZ3yq+7
	cMJUT15bjjB8QWUmyuai8WVbPQWLVgs=
X-Received: by 2002:a05:690c:6e87:b0:7b2:7dc9:35f6 with SMTP id
 00721157ae682-7c95d1d90d9mr235446167b3.45.1779221649856; Tue, 19 May 2026
 13:14:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260519181314.2731658-10-ameryhung@gmail.com> <20260519185952.DF0181F000E9@smtp.kernel.org>
In-Reply-To: <20260519185952.DF0181F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Tue, 19 May 2026 13:13:56 -0700
X-Gm-Features: AVHnY4ICog8fdZWJZkMlNJ-vus4YmpFdWGzSQ4dn3MNE6Ws9EK4IofdUn09OOdg
Message-ID: <CAMB2axNsE9gdE+g7OCcnpwm7Y1Q-Xv27t6-X9Vi5s74AfCq5LQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 09/14] bpf: Fold ref_obj_id into id and
 introduce virtual references
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 11:59=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] check_reference_leak() incorrectly rejects valid struct_ops prog=
rams that return a pointer derived from a virtual reference (e.g., a casted=
 pointer).
> --
>
> commit 4171c91972499af3939593f911ee11b4fbbe778d
> Author: Amery Hung <ameryhung@gmail.com>
>
> bpf: Fold ref_obj_id into id and introduce virtual references
>
> This commit unifies pointer identity and lifetime tracking by replacing
> ref_obj_id with id. It introduces virtual references to serve as lifetime
> anchors for objects that share the same lifetime but need distinct identi=
ties,
> such as pointer casts and referenced dynptr clones.
>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> [ ... ]
> > @@ -9854,7 +9920,7 @@ static int check_reference_leak(struct bpf_verifi=
er_env *env, bool exception_exi
> >                * kernel. Type checks are performed later in check_retur=
n_code.
> >                */
> >               if (type =3D=3D BPF_PROG_TYPE_STRUCT_OPS && !exception_ex=
it &&
> > -                 reg->ref_obj_id =3D=3D state->refs[i].id)
> > +                 reg->id =3D=3D state->refs[i].id)
> >                       continue;
>
> [Severity: High]
> Will this correctly handle struct_ops programs that return a pointer deri=
ved
> from a virtual reference, such as a casted pointer?
>
> Since a casted pointer in R0 receives a distinct non-reference id while t=
he
> virtual reference ID is stored in its parent_id, checking reg->id against
> state->refs[i].id might fail here.
>
> Could this cause the verifier to incorrectly flag an "Unreleased referenc=
e"
> and reject valid struct_ops programs? Should this check also consider
> reg->parent_id when the reference is virtual?

There is no struct_ops that can return a register derived from a
virtual reference, but to prevent such false positive preemptively,
the condition can be changed to:

              if (type =3D=3D BPF_PROG_TYPE_STRUCT_OPS && !exception_exit &=
&
-                 reg->ref_obj_id =3D=3D state->refs[i].id)
+                 reg->id =3D=3D state->refs[i].id || reg->parent_id =3D=3D
state->refs[i].id)

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519181314.27=
31658-1-ameryhung@gmail.com?part=3D9
