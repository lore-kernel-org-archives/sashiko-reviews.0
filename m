Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794917322;
	b=WvTn+4sDVZuKVewd9wCw0TvNbmnE/UusEsNygiwys5fNm/L3n5UKr9RY6x0R8FQxxXqx
	 lpdE4/t7iZhhRpwZBBWpQ+V6cRItodhHVvhMfZE7n8cA6zTXiSt2n0ENGgBP0Elx92RNm
	 U5K1UO6STWtZUJJuNN+BedXzR5NvlglUcj5qSVQwLiZmg+fs5+PQWguPjyUJxOBkkp4/e
	 j+ee+rKW0iLSg0Rz9p17Ma7kiDF3rB4ksV0R3W4GWjfZ001nCflMWRR7loaxxUdd/Oswd
	 lOZq8cBlRsXDdcHdafzcNPahohGOVHvufJvWI2ESOUWPZdB5/BhCTskwWLjhzy0jLeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=+OHBE2JjZLc89T9aDHp47BWoMn41dvghwLwUUjrkALs=;
	b=VCBjvQp+irXbdA/0/ertFxBl0socEBwF0InJD+KowxApvIN924s1CKYsJL151t3iiCX3
	 QZwzIstYkyrUwkvNNDe1SrjcNwHXqpgAjAeNaT6w0o1HkSZSAdl3el5DcZBPXPhN5ro29
	 4zjxS2Z7DxuRxCJLYKz58TtOW2LKi+VA+bxJrYMNs6EPesF+h5a8W3xh0L0vDVk4xYTv/
	 XAVy+gLloiuSfwMNDcv/jOEFh6WFFahAf05qNQ2RyFKObcukDjh32dW7mqYc0UdFyDT7P
	 0zo3t0rHkRwgfz4yWuK/VI49enDA/5oVefZoilgdFr38VMa/aGRpLeNy0vwi28rzL9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=rkWrm8tA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E881A606A32C
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 12:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E881A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=rkWrm8tA
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d21051042so274061766b.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 04:08:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794917320; cv=none;
        d=google.com; s=arc-20260327;
        b=PZBefriuXy9v/51d6GIdrh3Bj9xo7t0mW9EyOKbIEBRN/lBoVnfFr5hrZFiD63wooZ
         5zz9FfifijI7wZoAFbBW4K9ZF0WGikOQPOcUy7st1XnwMNQQDjs1MOq+8XA0ybZsQX+E
         MFsfohJSB5cnTQIoGU3H01Xa38ehyNkRkrsgO5CDyyhfu9uljkff4utSfqNE2gZ6Won3
         mQNKUxBqjcbJS7g7qh8E5TAZVtRlh4i8x6ItNx+1mVw+Rxyl9PPz7oelMmag7UYrNd/P
         x04v7rM0zjVav7y2+0qQod6T5dhy/9WwEtqqJnZZw8A3pvpODVgRLH2CWfJPCWAa2olm
         Bpnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+OHBE2JjZLc89T9aDHp47BWoMn41dvghwLwUUjrkALs=;
        fh=/XafWwXInU6xSAMitUKTVJtcnn7zkW/jx5Qszu7SSug=;
        b=C2d47dXHhhe1gIq4sGuxs93UxAxa3Csrgwp7xTR1NtM/i3KXR8sSbe048g4lC5Pr6n
         QytsyOBHEhzeqQkI1ZNJ4ahEq9FjwAhBKeSYmJQ70RfZI4mZqPe5JEP2jQkZr3TL8Btd
         GBPn3BBIkVyCVHN3ZpXA1nJ9HF4jFGrX53uHxaGc/xwhUVX8gfJjpiSTfydPsoBT7dBz
         xcoF/K4fhZONrr2SA6zkbCwm+k9qufTGQhI4MA6mo/vz0mk9xTFEEwwQ3HvA7WfEz8Wd
         /98v61vt6OvIcg2MiYql98z+jFeX44hj7xwgDaWdut0ner3INCq9/qHw6mzfZ7xND6cg
         Z0+g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794917320; x=1795522120; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+OHBE2JjZLc89T9aDHp47BWoMn41dvghwLwUUjrkALs=;
        b=rkWrm8tAqew5CZG01j8VdTp535AP8mkWam8L0NS9m+Uzryp1jpBkXWYAvwPdens1qT
         htRRdygh5CA+U79fCeSDRnKtKSEPYYN6eqSvXrNEZF0pBO/H40uyNBaKCevZmyijqU9S
         dtgw4nZdr2BBoDHMTGRqFS9wL34W06sHlYvPGJDIyYZ8WwwQaDomq7Js/q9BhWD6qUQ8
         YcS+qiYoipyuzVY0crZofP6Plft1RpR70SRPR+ImCddMkp+jQAh8If8Z1PwgYBv2YiBQ
         cVylfuE6Y5IQnHtCJoJN2Q2LGckpG0fio41HTIyM4TSopd5pTXm0LF2EMK5P42rWEDY4
         9gKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917320; x=1795522120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+OHBE2JjZLc89T9aDHp47BWoMn41dvghwLwUUjrkALs=;
        b=yNwQCkM72uf56y2H/EtqwPPvXlNVMDT2PvWQSAwDMiV7Uxcoo/0rBUrb1cEc3LIU5z
         ddcLjB8eI2Aqvu0421p86yDEDk6rPcPhNRw4ktOEy83My8ww8G+sqMLd2NzBmR5UVyzy
         rguAYQ4kUH70xG8zwA7qCQfwZI79bVT3aHhs9nNM2nvCesmkddeK2zUiRGsyfo4s+S5f
         vM+X818iSXwM4qakWZKX1HyVAIH9F6g0lcITYAXc4vyyCu8cTdE5l/cmyBB4cyFuvcx0
         +PE7ig29thLjO0P4dN4IbdTr0wRS/mpJa4kGRicXAxsFkqOQ964P5FVt790dsNLxgJi6
         6sjA==
X-Gm-Message-State: APuU4Z95GfFVZXm0C1bTFdHQnSjqwRolr+iggsIrhXu/NU9BjdX5s5RI
	l96q+KSIa8ek5zCYCQ9pArHlJ61rO2wMoBhghKDpAMIps20oF0Tm/WyHjxPb/RXwPnrI/+avEcu
	Cbxj3CgYeZBVYM0dG+d+RTVELVUKUbp+DxBP0XtbJPj5QWJSES9SjjqA=
X-Gm-Gg: AYBFou3uW9DgIzmnBi8FNfSb7hQxiyTMgX8bU9z3G2fK2VttWj+HkV2SRwkS1jYdBqs
	HrtN9EQHjb40CDuxcKu5UcwA9n/6UngEK+e2RWogMVi52+kRzJfrgLFZZpL+bxO5B3/zlLDGIYK
	fJ8s51USCe7Sc+C9kdYUnQaQsIYHVTRHN2RmNq0RtFcV6IYifRKnoRZ8qLA1j9wRzG1cdD4sopm
	rURba5MYDsHR0VLas9krJ+XIT3eDnXuu6cOvpeq7wWvNPA9igKWygm0N4erg43rICbE0vbhycsr
	DI3aWzkSVvoSnMqFCPuROttlD1vpn3dYILd7FouL9bCy/lSHTLZ51pN8WeSqFkgid2TSVJK28CD
	JjIfD8XebGdn8sd64ADZgDMAYJQ/haDS9D0V0hLYjM9DKMTllDVoSzvz7L7xXpUAgTnPNnA==
X-Received: by 2002:a17:907:9816:b0:c4d:4e5f:b138 with SMTP id
 a640c23a62f3a-c5096369186mr1083292466b.20.1794917320250; Tue, 17 Nov 2026
 04:08:40 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261117-tcpm-soft-reset-sop-v1-0-c7e1543828c0@flipper.net>
 <20261117-tcpm-soft-reset-sop-v1-3-c7e1543828c0@flipper.net> <sashiko-outbox-218719@kernel.org>
In-Reply-To: <sashiko-outbox-218719@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 17 Nov 2026 16:08:28 +0400
X-Gm-Features: AclHuK9PeAuyPN_pcoVBmzh2_P9HC6pBnS8MlP8LThdzwdwiJeca3XY6jANi_vw
Message-ID: <CAKTNdwGqonU2w7UhFSzoGZCXORgg41iMnefDs16rFgiCUdKGUA@mail.gmail.com>
Subject: Re: [PATCH 3/3] usb: typec: tcpm: Keep cable plug messages away from
 the port partner
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 3:42=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] usb: typec: tcpm: SOP' VDMs in tcpm_pd_cable_msg_request()
>   affect partner
> - [Medium] usb: typec: tcpm: SOP' PD_CTRL_REJECT in
>   tcpm_pd_ctrl_request() resets partner

These look valid, I'll see how to address them in v2.

> It also noticed 1 related pre-existing issue this patch does not
> introduce:
> - [High] usb: typec: tcpm: infinite discovery retry loop in
>   tcpm_pd_ctrl_request() [1]

This was addressed separately by Xu ([1], to be applied), and I've got
another small patch on top to go in once Xu's patch is in the tree.

[1] https://lore.kernel.org/all/eqdhulaftczpqnhu37rmf3ajdpntjnlz53tx2q7ugab=
zkrqfe2@amdz7hafys4w/

Best regards,
Alexey
