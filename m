Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DA040D597
	for <sashiko-reviews@lists.linux.dev>; Tue,  9 Jun 2026 19:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781033306; cv=pass; b=bGp8ciMEAEo8iQXgeVpYTui3Sm8CJbAv0G15F60Ty9+jTDXMgVmHWhCC35FBVB6kwL86L+SdM1ArEUPMPKAm8hfb69yZ0V4DSO8eECEgXmVxuEDVTjGBvQ0/1WrVVK/AcIbEJmf+J1RV1vwqyju4IkNK9eWyz3RBVJdBkooMiK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781033306; c=relaxed/simple;
	bh=i/OACinFgLu0muBhFCcLI6Uw9QvwUuOTqJaKEKBoL/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XyTV+Wmo7f8au/Hxa5quhOykDqcEFtF4CGokw4J6ZWnksdZyRi/Z1fPVTLttICyFbzCkStd1vpFk/inydRR0YatWcvIY1U4GGSwyrjBI9VfJL4aYlZhVFYQ/WERt8mVj1kbj8uAX/G6J87ucmmX1swJssmvBWvzEIxSHI4kHQ50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sYjbVnyE; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sYjbVnyE"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-304cf9a02f9so322049eec.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 09 Jun 2026 12:28:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781033304; cv=none;
        d=google.com; s=arc-20240605;
        b=IlToMaLZ8OQ5tNdON0hIfcaxoC5h8bnjAp6jvyt9nO5n4l99rgrIE9l1knuoluo5r9
         4NqchLDG0maJASqNjLVOCoqJrdtHuFdvwwqfAyHYy/642Kl8oWKWTQFHU5r3HcW5gEqn
         M+SnHTXKPvw33ymlt3dTtPR0lMHfK1ThQMUQYmIhLdQsn8ptz5B6T70oLs2L0tGFlHXY
         gRFoC0oJ4rUt3yixat24sKu5kLC9qgbiPY97mvBP1CJA58RsTHjYu3wPY4oGZkN7pP1e
         4fwknFzzPE8GBsE9ycZgdIiUWnY+E8qA+bfwPx1NbnRm14wTADnNrGVqS5B9mI9sT2g0
         ScKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OJg9nwIv9ACqjDswvJZaERxDdDEAwRUfl02ZMVnz9zo=;
        fh=54Wv5Z1StEH8pb9vxCj4wzF9QrPAK0+Ysq6NknNKCIc=;
        b=gY3BuW89KlMh0/E5yDpkBy3vYBGIQ7WhLIBf5KabJelc52uZO0/hPi8ohT37ojGK6q
         Te3WS9AkqL/8Ei0UzZNZF3XXQdVQUOnoUw/4D6zpkrFBv5lcCKU2+Acr9UEI79HJSihM
         Z/ixT8nDeAyObw/QKdUcZJo0z/AXM1NfWnXMm+qBAAimuXNwu8C/xw5xBDd3h8AbWko+
         Ry6nWOt051qokq8R2zwu8osQCcxIM7s8MjEYf36jNC3B6zk0oIWmrW1nkFzkw1dWdWlP
         rY0xn/BkZ4ZFtmGNlL05pLph0nnPI2ih8n1D6XNOV66uCD3D+3f9ZrPF8rbiw6LGjBvf
         2tdw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781033304; x=1781638104; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJg9nwIv9ACqjDswvJZaERxDdDEAwRUfl02ZMVnz9zo=;
        b=sYjbVnyEkvAnfm+rb0gZGYYlzuoTtzRL7M0oaNOuZldxQgrZ7WT65IdiN9AezJaqwj
         XTQGCJFebrzKQRFLGgIGkfTgcX3W2cexo2OfeI1AsKa72Pol+baii9JRMtprS1oXafsM
         wB1QEaDjGxKPOI8Fat6CLVwqsQ5VEJg0nipQhaRXc9OxXvxiqH2L7YkoHYKN62aJYhfH
         s2Z78t3ST1xkuBCdHVAo1wohrG/zc7iBkCKZ9z69VrvKiroDwdXuaH6vAC/BZIqcnYz3
         saL2O+wUmQKkTAx57sQHIev578TgKKdjvMljyZL5YhRNHPVjtfmfBTszG1lJyalnkKfx
         UDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781033304; x=1781638104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OJg9nwIv9ACqjDswvJZaERxDdDEAwRUfl02ZMVnz9zo=;
        b=HuOuJHrP6+cTltm5s65IkPj14FIKwGF0H7kWBfzIzY5vUdpbzy0nfRuOe4ktO2Wabo
         XMN1TU8F1pwzFNnOke+YvDfNwjeKT908Oxt0beVLcsm1rmIPluMyBQo1av68cfKg0wCp
         pFhglTgrNAZKJKjY4cnQajlzTnjq+RG+antSeRxJPFpZ3Qn+QxhV91lXfSiyFDCIxRb8
         ua20yALItlhlEWOBYYxBDk5OIVnG+wdRoLY4SiJ3o6uRtdsymgMQ4MkFAx9l0fxp7CQg
         YtiGWKMsyUf2HfD6yjq4cSoTnO2Bk6Yn+q57Z9QHQsZFjdZzLCCJmWIWH2QioJ5crbzx
         hXng==
X-Gm-Message-State: AOJu0YwEHofSY6y5rnrVt6exxKYKLxGUMlIgVz2S0OYM/YSyEBtPIYQD
	yn27IrLXWl0mlGh/yrgNvUDrj1SuzwCft1lmxoHPdqrX/4eFsf1NiaCLG1a5Y8eM+UTY9XUjhRV
	YKgvvKi5MVDO5SCGUZqPy0lKrkCgfAdg=
X-Gm-Gg: Acq92OHDkcBwz55Wax+yUyGYglZZAkmwLddt6gjndIW34ElzNbGAOD2kxb4RwnLLjxk
	/7NV1pcXKBH824cDm4ndLR0x6InmkywBTLcGWx4rr36ZLHpuwisOxyrdsmPfKSdSXzVGJnaLwsS
	qIj0rjZlTMwvosYQU45FKX4mlbr4BGwsgNjnYStpvZWURb9Ghi9q+cA7+rDEtaIB2Wu62ZCDL6u
	E27eYcS/J6Kn1rGvJhg7SJwW/yG5akGqkjU7Utz/KWhN5kSqiErAfVmO548eOz9VwA8iXhdWbj7
	69/IGMGS+lZ+7zbZNh1k0pcM7Vy76YbAC7d7ZEFv9cMhgBUurddHd5dBC7xuoib2MRcztTz3btI
	TjxHdcv9+EA7f+7xFRR38svhMUAXx/zUKEKSv+oI2ndoL
X-Received: by 2002:a05:7300:a509:b0:304:f860:3ae3 with SMTP id
 5a478bee46e88-307d5cf2045mr1484875eec.1.1781033304355; Tue, 09 Jun 2026
 12:28:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260608183057.2001376-2-lyude@redhat.com> <20260608184329.0BF6C1F00893@smtp.kernel.org>
 <8898fc261aded12d8adf4c5a74cc6bd830072f27.camel@redhat.com>
In-Reply-To: <8898fc261aded12d8adf4c5a74cc6bd830072f27.camel@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jun 2026 21:28:10 +0200
X-Gm-Features: AVVi8CfVgY4o06ZxMCThAreiMyLunTvD8jssVSLsOSZ1KkZvxyFM72Kt74QKoKE
Message-ID: <CANiq72=_t6wc1mx-AmiOCQKf0i0VvvjFLf29uCBgbgS1PmPU3g@mail.gmail.com>
Subject: Re: [PATCH v19 1/4] rust: drm: gem: shmem: Add DmaResvGuard helper
To: lyude@redhat.com, Gary Guo <gary@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 8:19=E2=80=AFPM <lyude@redhat.com> wrote:
>
> Looks like the magic 8 ball is either hallucinating or this needs to be
> added to the documentation, because there's clearly nothing about this
> in the documentation. Ugh.
>
> If anyone can correct me here let me know, otherwise I just assume
> hallucination from the hallucination machine

This is the the prompts we currently have to guide the AI:

  https://github.com/masoncl/review-prompts/blob/main/kernel/subsystem/rust=
.md

The goal is to eventually have a single source of truth for this.

Having said that, it is a slight hallucination in the sense that we
don't say `inline(always)` is "reserved" just for `build_assert!`.

Cc'ing Gary.

I hope that clarifies.

Cheers,
Miguel
