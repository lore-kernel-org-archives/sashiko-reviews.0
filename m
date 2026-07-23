Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C8A486E63
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 18:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784831760; cv=pass; b=KzKQg7T6T0mGvZ1y7lVKgmzOjkMYZ9W7OqstNksLfeK/obcJ+c92Q/zKsv7gJ+gukN250n9LOYeZAmdBdAYhNXvcUj2oDHYCN/QnBL9dd59VbRCYVj1qThrnc7QaVpkP3MlBn2WRgvV5C4WqHUSBcl8VEhiEW5hlG23UoevMInM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784831760; c=relaxed/simple;
	bh=Bb7c7PXG5uy5wbFp3hNDteby9VEORJNPu3ecqOZWNzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZMWvifom5ZMBAu2UNFhq3fRksOwjuj5CTZh+P9EyuZAZ+KuJXFTBJxqn1jLzRaAnhLj9LNiRbUqinZEcOswhVYW3FyetdOTbAQ8w7M9/+9nsvQ67bcXhWa/LNk6hCtR4MCSbwbaVq0WijDyHD/+RX6lbWkphEgrp8/lh/RFb8ZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zscr+5lD; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zscr+5lD"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-81e9f7491ffso9292787b3.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 11:35:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784831752; cv=none;
        d=google.com; s=arc-20260327;
        b=lZ73WGubVJUlJcabOj2x9FfAsYjDazLE6XAyrR3mh/gqQVJted6TXOWNbsMu7Xpnsf
         zmjFc1qOWWHWCa3IFhtf9ag1y0CjB4GWIC0r2UoJlCMhMxxJgrsu56j5RYt3LF4DAoZu
         qGBToHq0XxcvFLsYDH1ayaQNWgoRbzkgYEdgEHD2KF2rxc7k8eTIbaI2w9isfRLSrTpL
         BvRTL5Lfda8TXabLJJNaDLz+1G78ej1GMrkEtcsSlaoyfyghg7sJ7xGzGoQd16Hwytyd
         GdWe12axzC96ALaC+uZ+Ra1U+9OtphfIZ5TFbiR7J4OQdWaAPTTBGfcQZT0JNccg8fk4
         Wqew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6JK020c9+x/NFTScqlE+I6Rm38dLPHigKvNY3L5rM1E=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=PNQT7kTYTknO4EvESXJkSUkYXlnfDzrRFDN0nQJwI0vTy6HygCsE9alUwNFWxaM4JF
         mbn+I3NrUoXFiwD+L1i+7DXIWsRJf7xRK7rbtsw8LF/KfTshrwGJwU9TNVUUxcVPS4TF
         0J1lwFPagpdZpesEwGMcqVP1iD7/KDVLGats4zUWcYAjrew6fmhbc83tj+lNgncmW73d
         oahsiIdoXwvBN/nZ4QJoN6ntm2HsV409nzXiKxa4DBCG+t8bVsswP+ibkoqN/YtBS3zW
         G0bFJZDBHOirCawUfFPP3jjqQ0t9v8FCBnsKLdD/gr3jj4hmeecOUrjgYAVq399QwEBC
         M4lA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784831752; x=1785436552; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6JK020c9+x/NFTScqlE+I6Rm38dLPHigKvNY3L5rM1E=;
        b=Zscr+5lDO2P24F9Ke0tp92y5JqLQxoDsDGAccRn5x40D4IlNojBBQkpgujqpISO2MV
         Nuuhbf0DMyS99hnN40v/TNHquQYvsrCJ+3iNKS2GoX7sgQDogona7iFN8JhsnBfjIE3a
         nIxcC+2cSPdJRUcgHfAnvJ+QA8Qy1AvvDpU/wdVAvGqjrzPD87YEm7oodebM+TtlW4e6
         5e0Q6qy0HYbtnx3o379ySiXYdppHkqc/2UgfVDo8XlcyL7HARzVyKmng5q7X/VnAeHBZ
         JXwvXmd6+CSgKN0pTWQ3YfqcF4yAcbZA7qwUGIcIHexDQfE692JA88doJNfCYCLrwyIp
         Er+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784831752; x=1785436552;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6JK020c9+x/NFTScqlE+I6Rm38dLPHigKvNY3L5rM1E=;
        b=lXJL4OexvIRLyEK0MTZ4i1+e1ueYAH5WKh8o7nIyFGeINFko6L2fqI18CILlGZFNEj
         h0dn7QLVoWgH0KJZxpGV9bGInWE7/TjPCj9569Kuq24RMKPJaZl6qsnHZknWpmsPe5/i
         hCVjoD6f/E80fhICj2FvbEXfMxmZCELGmwYOv585/eWB4JcM3Czy6pA7b1i6auga43LW
         dGHcUOEHZepaCs3vbmovx0Sv8U/4vbEOnSZXasAdkCyo+z1+/uEQdW+H+ptTMm71NtyF
         uhDqFEHxI5CMpd+fklcKs83H+D+OFxN3gPLhjHW6QcKVrGACNuAosv+9ZAqG5qaDcbdp
         b/IA==
X-Gm-Message-State: AOJu0YwP7UivlfHCsLqW/VBpvYHdNbmZgoMTN0QWWQIhgTNudMZRwJHt
	9/J5tfBJ81o6lR/nB15QUkOBEyVdAQR6+Aan10fm2UPXqgSCy/TqgjicEgiWevLiFmuHAK+RLTY
	grg/eRgpW9T/veA8eAoLl75FvPpDYNvIR+g==
X-Gm-Gg: AR+sD1108SzbRM1rFqfQS5WaS25XzYf137NffAHd354L5REmhZJ3u4VQuRZPyp+MGCU
	39ciDz8TfVx+6ibeaqmqnihCJOPLzkHOcFOIXg2k0Se46tYg2x9/pfXR5xr6ZMww8lXYR1l6X4Y
	F4MazmGxA/ra1Ilp6WquSe2j6ylRujt/v+Wrb3sAH0VuCJUtr243GVgNYMnU85AtNEcU9P1UKcK
	tWqHT4BwLpAvdIeaAYAkHnfk5I5bmbhMiYZQiRswRhgNrZoyDiMejhzgYgcZw==
X-Received: by 2002:a05:690c:3605:b0:81f:3dab:372f with SMTP id
 00721157ae682-81f4c14de4bmr14619757b3.12.1784831751774; Thu, 23 Jul 2026
 11:35:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260723050806.1158442-1-ameryhung@gmail.com> <20260723050806.1158442-7-ameryhung@gmail.com>
 <20260723054216.001381F000E9@smtp.kernel.org>
In-Reply-To: <20260723054216.001381F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Thu, 23 Jul 2026 11:35:41 -0700
X-Gm-Features: AUfX_mwhGndatDVJ6IZ8uPGDvTg9e0G_B0Tmqr7S6GuhZPfuaMemIq8vAAhXwHY
Message-ID: <CAMB2axN92ZMmEPOAiKAp_C9u1NdWVsNxM+=_D9L+PW6Szxed=w@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 06/18] selftests/bpf: Add tests for helper and
 kfunc mem+size arguments
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 10:42=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The selftest `mapofmaps_value_as_kfunc_mem_buf` uses an out-of=
-bounds buffer size (8 instead of 4), and both tests lack explicit `__msg(.=
..)` assertions. This causes the test to pass (fail verification) for the w=
rong reason, rendering it ineffective as a regression guard.
> --
>
> --- Patch [6]: [PATCH bpf-next v1 06/18] selftests/bpf: Add tests for hel=
per and kfunc mem+size arguments ---
> commit 967fe45d86aee49807b5742ffece3f858b20a4fd
> Author: Amery Hung <ameryhung@gmail.com>
>
> selftests/bpf: Add tests for helper and kfunc mem+size arguments
>
> Make sure the return of map-of-maps lookup cannot be passed to nullable
> memory buffer argument for helper and kfunc.
>
> > diff --git a/tools/testing/selftests/bpf/progs/verifier_mem_size_reg.c =
b/tools/testing/selftests/bpf/progs/verifier_mem_size_reg.c
> > new file mode 100644
> > index 0000000000000..78a9ad22b10df
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/progs/verifier_mem_size_reg.c
> [ ... ]
> > +/* An un-narrowed map-of-maps value must be rejected as a __nullable k=
func mem buffer */
> > +SEC("?tc")
> > +__failure
> > +int mapofmaps_value_as_kfunc_mem_buf(struct __sk_buff *skb)
> > +{
> > +     struct bpf_dynptr dptr;
> > +     __u32 key =3D 0;
> > +     void *inner;
> > +     char *p;
> > +
> > +     inner =3D bpf_map_lookup_elem(&outer_map, &key);
> > +     /* intentionally NOT NULL-checked: reg stays PTR_TO_MAP_VALUE_OR_=
NULL */
> > +
> > +     bpf_dynptr_from_skb(skb, 0, &dptr);
> > +     /* pass the un-narrowed map-of-maps value as the scratch buffer *=
/
> > +     p =3D bpf_dynptr_slice(&dptr, 0, inner, 8);
>
> [Severity: Medium]
> Does using a size of 8 here exceed the outer map's value size of 4?
>
> If the intended type check is missing, the verifier will still reject the
> program due to a bounds check failure (size 8 > 4). Since the test uses
> __failure without __msg(...), this unrelated bounds-check failure satisfi=
es
> the test expectation and causes it to pass for the wrong reason.

Ack. Will fix and add failure msg.

>
> > +     if (p)
> > +             return p[0];
> > +     return 0;
> > +}
> > +
> > +/* An un-narrowed map-of-maps value must be rejected as a PTR_MAYBE_NU=
LL helper mem buffer */
> > +SEC("?tc")
> > +__failure
>
> [Severity: Medium]
> Similar to the above, would it be better to include a __msg(...) assertio=
n
> here?
>
> Without an explicit message check, this test could pass due to unrelated
> verifier errors.
>
> > +int mapofmaps_value_as_helper_mem_buf(struct __sk_buff *skb)
> > +{
> > +     __u32 key =3D 0;
> > +     void *inner;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723050806.11=
58442-1-ameryhung@gmail.com?part=3D6
