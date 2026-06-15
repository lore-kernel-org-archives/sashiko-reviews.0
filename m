Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3063254B1F
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 02:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781490444; cv=pass; b=LoiYBUCzG3CwJmwP2g0KBQGivymQiNjxUIreowPZp4+GG+QNWbWpPsTxb4la6wKFOR8+6O8PcnVWOxKUu0jUKVnHCahu6YlE+DFiJ5wfSSOM4gw3odR5t/GCti37QLtmaYQUZYzK4zQehuqESOYLMuwbJ88l7OWZZ77zz1ieuf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781490444; c=relaxed/simple;
	bh=h3Lb92KHjPOaN4v/wiQxMgFhBTV+PhP6VbAF1WdMf70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xe6iyBtEBbmrHMrUSZplA8Ikd2D/lMiIzkrGpa6mFVhiMpu7se1fvD20cymIUQ6AxX2J0GhrSqAoVPgdR/Vv7CHeUyRfaDKtlYur+I9S7y9sxu+Cmqm+ZDZ4p6ZMoGqwuCUXezGY8dH2YovZej6ifP+x4XQgGE0HF6P98/MwdOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8uvRVNV; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8uvRVNV"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so21180265e9.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 14 Jun 2026 19:27:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781490438; cv=none;
        d=google.com; s=arc-20240605;
        b=jaIch1/XKzjn7hzoKSO9DO2+C8XkRbhVhRKoPuH23a+AwsKVlDILf5fCuXVMmK49Km
         g17pkq1zkSvj9fEPjpCCC42zONr3cgV2y7vzlzCwdARiVPpUaAOjizuc5bJ+FXORmCKq
         6mHyL91nvZGtHYZ9mC9Fk1C+w4FKhxdOX+40vTo8qGNHqyxEvWYHSqjE88DjL6QsPq5u
         GE+ax+ZPhhr0bGOVhzrVWfzhRJ19CKVSXX3nzT3ce8WCatZV1CMHJkFLrUwDBh6Yi0ni
         10oed4NX+umizD3a4z841fS/5G4yYIEaHxriQs22PLQ9+lbvMHJpxq4GayLHjxCijrJG
         wnzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h3Lb92KHjPOaN4v/wiQxMgFhBTV+PhP6VbAF1WdMf70=;
        fh=gj73vF7gfHpskuYo4ZPaNGDMo9r8lFxbvv5q5QAWYg8=;
        b=ZX2ekYrvaTa1Nz6xjD3N/4DEaCWb682fduv/2Sy11mmGChbOw9rgadayjQHz7xP2nn
         LxC4I9haHbBrseupttFgeLfkcuO9reTs9cdSl2n/SWbCWLtmM/+vhLb974bwrclvdmY7
         Uy5txPulXOBtJZnCouhYV4/KuQG5lDfirjA8NyZuf9XOyHiEvdJlauvpVndzmvHqKlsl
         161ro97AO4Hg4I7nybd5Ob1lidP5IvvZ4s5gVZC6RhIPX5tJIJ5sUfEUVnSBgEpPw+hP
         zviQKVHZNJCt2a7KJFrRLX8ErGV9W1bsyKGLJ95tKUAtwT7xb1GzeSnRvVjGgdy4qfqI
         8OgQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781490438; x=1782095238; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3Lb92KHjPOaN4v/wiQxMgFhBTV+PhP6VbAF1WdMf70=;
        b=k8uvRVNV07JWbjXctUqHtMcIE83rUHpUTYma1+xC+wdUwlw0hjUA+0xmxsqmmVdCin
         j1aS0WdtnJcK6GhGQUbUT5WKOg0pS7AIShXMfkRgTljYFbrNydt2KrDxa9JIC/isP7If
         0NANdLXXLktFWh3LAKSKlBNaIECns6/cRCTdsa3Kn8Atyzu7qYb49FDJ8jn2GEHx1Slu
         reTm/FYnrhjmoyRxUJTNxOJ2rGSy8ebz/dQVp+SrT4mkLWV770H/IjZUTSsY1yoNYrT+
         dK+znw4diAhPtDpSLEfLiCmHpmtwJ3QcBkGrw+jSIzemAplxcjGXx0XA1B67kU74D0iW
         wO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781490438; x=1782095238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h3Lb92KHjPOaN4v/wiQxMgFhBTV+PhP6VbAF1WdMf70=;
        b=OUJiePZgGMWh4PndjDO/JMQE6LqFYFQB5rNJE+uE51c/uFh61u92SYVo26+8o0Pln1
         TlwX7Y/2LddjWjoxCE1FZ+Si6BAOY3PCaqquBdskRG1le48yVC51Jm9fAshq/nblgN/m
         6+jK5+oe+7HeNlloclubcfl+h3r3un91y9CJdrEu+8ToxB+T+KdpO0atB9RW/oeEP+FC
         o5dUUK0xerZGRzjeEkS0K4Wv12lQC5ay/F6qF0kMR/rQ/1hbwd/GB/FUhZIqRdglpGR3
         LXbk5SpUMN1YiSioFo000HBzNO34a7yZMxrhz/XDfU6wwW2YfXk2Y2bYmLGPG+z6MgA9
         Rj7g==
X-Gm-Message-State: AOJu0YwCRrYDFEv3cBhYDd2iNo7cWqrM3+2OEKUygztHwckabORcmyL3
	TN5rYGqU8MsfoNfrxhhRS5LYmi6n/68DBnjccElyCxqo8ecsyE+3mjq3/hk54o5BCy5aZ42J3Rs
	eoSavVh9XsYbfsAcykNl+hAkv+AVJZtHqdIMQ
X-Gm-Gg: Acq92OHNwDvRtsHu8iPe5RKiUrcgjSS3u+sdNNCK3Z1/Jabstd9LkNutJFovi3ePD8S
	rP+JruohnmXmrl8LLoqKtpO3YCWysdc4zMfyWPE4plMtm7s7Xb8n2lMIh+ZPc5F87f4TOmakV4k
	fdVAzQMM+X3hON/TBnkdzqolYb8o6/TugLJwImuBp8JrxjtRySlygIKDGHT1SfFDVNIcEaHzg98
	UubbabapYkTRGkZC94YDgiNLjI0ftc3DwvaeoQPahm9UrMHxbhoG8/23XIiR6JEKPbFXE3KY+ED
	9hvPTC87XPG9PfF/yq6YdDr2cYzwM6ifEoIGcQ==
X-Received: by 2002:a05:600c:e54a:10b0:490:be8e:c890 with SMTP id
 5b1f17b1804b1-490ec4de5bamr99077855e9.13.1781490438064; Sun, 14 Jun 2026
 19:27:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612193738.2183968-8-nphamcs@gmail.com> <20260612201920.222CE1F00A3A@smtp.kernel.org>
 <CAKEwX=MqrydK84EUMuF-ZTPpW1Y7Jhb2Jwefr4v-WJ5N9Ebazw@mail.gmail.com>
In-Reply-To: <CAKEwX=MqrydK84EUMuF-ZTPpW1Y7Jhb2Jwefr4v-WJ5N9Ebazw@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Sun, 14 Jun 2026 22:27:06 -0400
X-Gm-Features: AVVi8CfQSE_G-befsGd-X73VcZwh3seB6NeCZOp9B5hjcCuDX41-4330PevBdq8
Message-ID: <CAKEwX=P0ONs=4ej=XY9GVNa95SQidgwLhZH-aefdHsjM3_jxsw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 7/7] mm, swap: widen swap_info_struct max/pages to
 unsigned long
To: sashiko-reviews@lists.linux.dev
Cc: hannes@cmpxchg.org, tj@kernel.org, mkoutny@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 14, 2026 at 10:23=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> > #define SWAP_USAGE_OFFLIST_BIT (1UL << (BITS_PER_TYPE(atomic_t) - 2))
>
> Technically it's already a bit weird in existing code lol. The type of
> inuse_page is atomic_long_t already, but we use the 30th bit, which
> contradicts comment "Use the second highest bit of inuse_pages
> counter". It's only incidentally correct because the range of the swap
> device never reaches this high.

to clarify a bit - I meant to say the range of the swap devices never
reach this high in real system that I have seen, not that it's not
possible even theoretically.

[...]

> >
> > Could this cause try_to_unuse() to abort prematurely thinking the devic=
e is
> > empty, causing sys_swapoff() to forcefully tear down the swap device wh=
ile it
> > still contains active swapped-out pages?
>
> Yes, this is a bug, but it's already a bug for existing physical swap
> devices IIUC.

existing bug from before this patch series.
