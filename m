Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E47492E34
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 03:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788925535; cv=pass; b=rl9/j7TDJ78L/XKUYQiDDkJAXU+4h2E0i2SyF3rtPcyMn6pP9WRC2gH10gcWTXFJRnOHkmZGy7kp7B5dLJuo2oreAJSYgnapbjAqns0JGUxCO9YAC+GD0wDWWoAr5/zMfHwFa/3gq2tC0Am2V2EretwuWnv3aPqz9MvVh2P+92I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788925535; c=relaxed/simple;
	bh=IXNmuepENNR4tE9HqqYaDhxsSc1n6zibwfYbLVTCyO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iqROGNneEgy5PZoTQfb98md/FGHgClQS+/R85aNLL2vtK5qG0DazGk6HByHBdTUHdk2ycvw2dIgrraZ1UKuwZTwjM6jYXkI+Rv+xtWHpku0elxLo7/E/BaN3qBWEG3dzDWweZQuauF8v+mbcmuLTc4TXSZG552dLUJKljmz5XIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egV41rFc; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egV41rFc"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-87f4e914a45so9408837b3.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 20:45:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788925533; cv=none;
        d=google.com; s=arc-20260327;
        b=NXfSmN4d0KvkZwblQf6dY8PkAvaPm8RN+ST5b2IcfmuWqbMSZFpvkQO9JuE9yYzmKF
         VBxskIOUM0SX5KtD+RcyD86RNv5RRg0QAvshnn9vLhBAKgXDuXDMLqcEGtBeg8DQBbwj
         8iioaw0dP96nSd4K3Ua660BIdDiYyndDx38/E9j7wvGObb2s6zvCL5o6CXDHq4KAhsGQ
         iJ7iQnZKcjUxaBNGKUu3zlHwtENgJ4NWveU1InWqEr+GYsyO56EOgXXyqRJXhuJKig28
         /BQbVOqNLsRY2EFh1hKBy+aRGAkkIO8UD8CBUUi+plhDbDTt/kDnj5djVuVntzO1QJ2/
         nvmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hZn/g/PqABJQU3OOPezBemcwd84aUSRVAJ6HUBRncq0=;
        fh=seZiLxWw5Duxn/nVZ1Pqv1j01Oj/QaPPA8dbLB2Kz6I=;
        b=KV+0e6TaJbKmS4o8UCuGvM5v3NNTw09kTBc2V+mWrkd2sloouxZbs5ADgJQ2rQrnkD
         Hf2xZdi9DEbtVgh5rX4X4g2so/O/BxgStVfhvNzfylClr2tPLISnOBw4oVD/zGKGUEIC
         N6T8u7in/GpWp63VHWPbaZcMH34dajUVM9JhR3yjaT55HRPmcM3sv6SrV93R72tggBGm
         QrLqXHlCX1pS9G41labgY2v1VYPhGXVs3tcUllzKm/5MY8UWW4HUX2sFm+yqV6PcaChP
         qmQsGm+cQapHt51b3Qy47fUE3KRNUR6c/euRM6l7ABcKPQRcXoB4/Z3ZxNZowMfjtmIP
         OacA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788925533; x=1789530333; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hZn/g/PqABJQU3OOPezBemcwd84aUSRVAJ6HUBRncq0=;
        b=egV41rFc1KmNQ+oZ6eMTWkyqTA+HcNFJ/mEiw/o4bL4VA5l0if9uKaJ93oDc3xKTaB
         Gq+Z+GEWNdoxitFOjqXA6LAZkvjqZV5L/Ghu9dOlZhHXNZhkN9z6TPrQtTjneBM0W9gT
         HLeb2NO/79kCJXTzCs3Kanfl5cm1UTZZni1Z6nQzIJkx4X0uEd4XSdT5ao2jev68Jn45
         ncB2i3sunbooiMC9QyC1abaIk7wNT7Td2m4nV6ChPjG0N8RNf9KOTsqKfPtNtPTL4fJj
         RJvftfBZxpMJ6snKXr/LLpBkkMJ4gadoSht/AP0Ern5U9YzBYXmqaDgcw95c/R8W+eS0
         ekXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788925533; x=1789530333;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hZn/g/PqABJQU3OOPezBemcwd84aUSRVAJ6HUBRncq0=;
        b=NMrT1N3gXvxWQPbXaFZNy1ARM2LE9/TCT6Qeu3CBQGbZqfMwOMaspvc/iYLE+WOaDa
         UTeTygfEEl0sM2SJWkoj7kBL9fC6u75vrOBNkreeaYBzmAGBy2LD4aGqRY6WQD/HZYrX
         9ZUhUYiAgdeeve0EEBToJl98YsrHYxgrsxhcfwM7K1N1D/EY6GBVTVKEZXdJgvSrJt7t
         h+P5XuxmBfwMs/Og+S8ROYieJXzumVRmeEOuEzapwuTBJktNgb03m9QI7KRbbrnZlfD7
         t1gxHxlrPzsHC7hSV7JTLDNQi7mOpWHuKKHQhOudIck8FfjbKMROC9H8E3Mu9qeVQBG4
         d5Ug==
X-Gm-Message-State: AFuF++nNNC66DpFxOeyRu/cw5SNNBYdEw+fY1PNsmjanQGy3gRYM6+H1
	1rgsolChb2uXoc/5NRmOJHagsUPf4uMBeFl2Qp2NI+7HViTVWHWxFBIGOS0Uh6124Goc9xCGOED
	CX7yXCLCXTZj4z6WXIeWmh5GCPTkL7zMw0k7+fv3Tbg==
X-Gm-Gg: AYBFou2MIblOeHyCHs/EG6L0uTlzo7RVCOXu24LuxcdIw/gdKpUfH482/wTSUoNoxDl
	vh2UuJ7pUgGuFgzQDxgtJNKyGEtPBnjVD0KaLS7yqm1uR0uRbafFZcvOwvvkNfrAMf88sbvL2QM
	Af//VTQjGc3pxDrV7fiBUcfUvqZuavyC8m9+9NMo8/cuUa5xQK9H5k38CjYviIEEjbVKkz+9CpF
	w/6bWB+hgIwJWPfUhVIfZDxIPnH6kn+0/w1jUFqCzletcMCLMzBdi5DeM6o8MH4wgQeDQ/eS5Et
	RXmDBSVqK+EvOtvFuoX6eJbfCf6fYJUO530Ds2Q8YT8drSC9CcOi3I9sGlnK8BRRbYda7K1tq/D
	XhULbczz0V+9+
X-Received: by 2002:a05:690c:a1ce:b0:873:5ddf:d879 with SMTP id
 00721157ae682-8735ddfda51mr71341387b3.68.1788925533074; Tue, 08 Sep 2026
 20:45:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260909024324.16002-1-laoar.shao@gmail.com> <20260909024324.16002-5-laoar.shao@gmail.com>
 <20260909025625.110F31F00A3A@smtp.kernel.org>
In-Reply-To: <20260909025625.110F31F00A3A@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Wed, 9 Sep 2026 11:44:55 +0800
X-Gm-Features: AcwNN1VwiwpG2WQP02MARWQxkcNbYWqZelwY3kpV9fIJSd5ESRPFeD9J7Iz66Yk
Message-ID: <CALOAHbCOFvcDy9kVVKRBAECnDi-vRcwh=dQQSC0ENeVxLYB_GQ@mail.gmail.com>
Subject: Re: [PATCH v8 4/9] livepatch: Call klp_init_patch_early() earlier
To: sashiko-reviews@lists.linux.dev
Cc: jikos@kernel.org, joe.lawrence@redhat.com, song@kernel.org, mbenes@suse.cz, 
	jpoimboe@kernel.org, pmladek@suse.com, live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 10:56=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Fatal UAF / Kernel Panic on module unload due to unparented kobj=
ects triggering delayed work in freed memory.

This has already been fixed by commit 7f4ca0d0b40a ("livepatch: Fix
UAF of unregistered patch kobjects"), which is in the livepatching
for-next branch:

  https://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatching=
.git/commit/?id=3D7f4ca0d0b40ac1ccd82ebaf1514c2d26c3db71c4

It seems sashiko-bot's review was not generated against the
livepatching for-next branch.

--=20
Regards
Yafang
