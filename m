Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B163033DF
	for <sashiko-reviews@lists.linux.dev>; Sun, 17 May 2026 02:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778986060; cv=pass; b=umDOLjBIw6UV+4Awi54IX7IEg1mJuNvfHphP1+y8ZCdSKO7jOJm6VqUcNYaHBLbcwTXWBpS129XGEAbbEN8RnM2cKaDvIH/PXwVxM4Lk6ngR+UAeKBOsUAdNqVyMuOA0WtY/N2qM3dUMNPvM8JzzWpbY/yB7iANynn9KKx41NYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778986060; c=relaxed/simple;
	bh=ruqx+4ZpoANkvP/6wJDfU22hj3FN+CW5zvVfsEmdrPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JpTd0DZ2Buc5Mkd5bWhDM8NHWEUamfTxG7PBI1ySLjgVIj1kYrsnwkjZJkc2MkGv1HPp8RnnvKTot4RRI7Yz4j4tJfrToSsnsauAipaH0BBLNeSGw8uKxm4Jlabbb2C8OKsBYboJa3A1HiTbr8i2FlmaHcU+CkZDq3odaTJfIxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=je4f8Lgz; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="je4f8Lgz"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a8891f0c51so1332873e87.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 16 May 2026 19:47:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778986057; cv=none;
        d=google.com; s=arc-20240605;
        b=GxdKP+0D6bDfbuG3d8lNZvRJPJU+yFSg2ptZLYHaw3EoMLk8D6uuO9C2yLTy8aZYvW
         c7wr9Ambx/S2BB2gCfpuNtOlTVhVuI6/CLPEPFn51Q/NM7AXVKF8vkWBxNTtstHxAUH0
         JNzN5iwTTudmeYqvLkoaN9W2tdZdXTltwkXv07OZ542ESU9OZRAWSDRx7psic10a+21f
         d++I3Txn7U9i3W38w2YAySx8IHQzBdWNdDPYMGza9jVXAdOyW/zrnQKGEWIJ7y7J5m3W
         EDDY4oNbzgAF0XevThVFOExYFPnVrvf2nsoe+rFVBHzpG0ZwJZxd88TZltS/hx6SoA9M
         HbEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AkgMTYERqKYXQClsS+xJ7UBlWslErJcPF/+isJjeW08=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=AJrZr6YC/DHgepEEEavKpcH92vTZSlOHug+VZlITud8ZiIzMiVfwQzKKxB7dyHoqG+
         1WauFNuF0tsD2RXeFtAf2dk6VaqUh1qv9NLMJmsmMKnwxEylPw4Qbp70X2sGJrUYF/e5
         DU4BAOumWKJylzVg+7wKnriLnE/WVrB5qCezYn0zPzeED6moyU8WYhLPsqvM3FuZEmMb
         BxN6A6xtuL4VKomVJ3g9sWKbBpgSJnEVttmafM7XJFy8rJGK7uHx4xa+ZLYENSmV+hQ7
         SQNIGAGKDrSiNqKyNHHEDizO7BEQhDU/hSEW78qwY+dFTcwwAo4BOuXJ7bsurkNL9EVv
         s+Fg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778986057; x=1779590857; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkgMTYERqKYXQClsS+xJ7UBlWslErJcPF/+isJjeW08=;
        b=je4f8Lgzo13T/49AiIJ20qXymhv2NSH3olS1MCk2QeEyUMFqGDBUbwZAuYM34GsU5x
         UrNB8PUCbi2/nvz69aaGrfS9PgHt99mhM5ORxp9HfzTKZFucUAmWiyCagvTxIjtyGxsT
         y1Qk4HChSkBDyYFGoRRJgiR+xKe41KlgnB3Q6HuVhrqhAke3cUKBaFocGFyI9wG58nFT
         AUG0CIA2Jy3G8bVMMS04wR2sduQvB3EbVDnGhkPd79SxvPmKKSJCTUcZ3NAZ6dBiaNI0
         8qALQev9/2DUB/M2k8oNgflcfBTZdZGbUPERLhMDkrdqJPSKf/p84UyH8Y9du6N4bbeA
         XV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778986057; x=1779590857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AkgMTYERqKYXQClsS+xJ7UBlWslErJcPF/+isJjeW08=;
        b=jdFiwhR0T33pEyUSmbTjBvvXBkVM5j6wWSY3lIzC0HV9MFcipGDZCnLgoGKNlgObrb
         y4dXu99RtuY1nUJOixNyoP5oIL545RmBLQhnAh98omYwul4zm+0R82VJ4wqWt5jnmvxB
         A7H1XzLfHAESI+IoIBHxtSd2X0n7AIpM8tkC6V+PYdKb2L631Ga8pUKsz9XyAFJOY559
         MiImiRt61fafO/kY+SYF3fTxpTWq0Ij5KaqTD2HADkmfJ3fkyzJsiEjpFXy3MnshQigC
         iMh0WolVjpW0KaeIrLFYips2k9iFv+iaBbkh42PP716mpBLDOQysAQ5GLdMb+7rW+FRk
         7qOA==
X-Gm-Message-State: AOJu0YwEOXwXpVPKdoElS/2fbeemmkJUTHYyvJfIO84ACv+JUaR+XoWl
	+R2NWkyWYN5IeTAZglTDiHZ/NpTiLzLgRp1/gBp+ppVBK0p/Kz+QD0Mpejhimv3sUqRa80dCCY5
	Nbc+T47ATEPsEP9JJVtzOx0qgvf5CqInjyJongFo2Yw==
X-Gm-Gg: Acq92OFoiwaJwbjVWRv9WDXyeNYj5hXqScnU0yIv9L32+JRUkW1UFgU35dxL3jMh32F
	NVsdA4gkHLUcmKX+7JzhoUUti9gpx3m2ggpRRHPGaaFFNpnYoA97I4Tg3mPkqogjmomA9t+C6qM
	zQBoQkwXhrZECWG4G9Qsz0Vd6MXgxPop6jhf5nw3y+VUit0V1ledIhe+j9XZYiuoe1lwTKtbG0Q
	MnmyuTy44FAUfZGM68L6g/EqfYxTOyEQKcou3DGYO6ReiO7hTlIOTPxpwjJkxro31jHiR97y6Rt
	FX8wVWVxZ2hXm1EsBs01ye2yAjL5iiul/TcxYT4=
X-Received: by 2002:a05:6512:3984:b0:5aa:b6a:738c with SMTP id
 2adb3069b0e04-5aa0e746aefmr2780889e87.42.1778986057362; Sat, 16 May 2026
 19:47:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260515123018.80147-6-kerneljasonxing@gmail.com> <20260516123128.BA67BC19425@smtp.kernel.org>
In-Reply-To: <20260516123128.BA67BC19425@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Sun, 17 May 2026 10:47:00 +0800
X-Gm-Features: AVHnY4L-iFokiRPqgurbcUPmAx3pih_JT3mO7CvkXys8G8Yfu1U15wZdD3zX83w
Message-ID: <CAL+tcoB=cW0tuoJLfoRKoNX2rYSTcF_c09nyZqq0ZZQEJHJP9A@mail.gmail.com>
Subject: Re: [PATCH net v2 5/5] selftests/xsk: fix multi-buffer invalid desc
 tests for drain_cont
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 8:31=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] Premature exit in the newly added `wait_for_tx_completion` drain=
 loop causes the test to silently strand valid packets.
> - [High] Clamping `outstanding_tx` to 0 in `complete_pkts` degrades test =
strictness by silently discarding unexpected completions.
> - [High] Unhandled `EOVERFLOW` error in `kick_tx()` causes spurious test =
failures when the kernel synchronously processes invalid packets.
> --
>
> commit 51fe3cee29ff3a261580a926424f8e6171690b0d
> Author: Jason Xing <kerneljasonxing@gmail.com>
>
> selftests/xsk: fix multi-buffer invalid desc tests for drain_cont
>
> This commit updates the selftests to account for the kernel returning CQ
> entries for dropped and drained multi-buffer descriptors. It clamps the
> outstanding TX count, adds a drain loop to consume extra CQ entries, and
> modifies test descriptors to stop drains at packet boundaries.
>
> >     - wait_for_tx_completion: add a drain loop that consumes CQ entries
> >       after outstanding_tx reaches zero. Ensure remaining valid packets
> >       are transmitted. This change is made because of patch 3 in the
> >       series adds a logic in __xsk_generic_xmit(): return -EOVERFLOW
> >       after detecting and handling the remaining part of the skb.
>
> Since the kernel now returns -EOVERFLOW after handling invalid packets,
> will kick_tx() abort the test when it encounters this new error code?
>
> kick_tx() is called by complete_pkts(), which checks its return value:
>
> test_xsk.c:complete_pkts() {
>     if (xsk_ring_prod__needs_wakeup(&xsk->tx)) {
>         ret =3D kick_tx(xsk);
>         if (ret)
>             return TEST_FAILURE;
>     }
>     ...
> }
>
> If kick_tx() does not tolerate -EOVERFLOW, this might cause spurious test
> failures when the kernel synchronously processes invalid packets.

This review was made on top of 0003 patch. It breaks previous usage
which means this review is no longer valid for the incoming v3 series.

>
> > diff --git a/tools/testing/selftests/bpf/prog_tests/test_xsk.c b/tools/=
testing/selftests/bpf/prog_tests/test_xsk.c
> > index 7950c504ed289..488ace93ff663 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/test_xsk.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/test_xsk.c
>
> [ ... ]
>
> > @@ -950,17 +950,11 @@ static int complete_pkts(struct xsk_socket_info *=
xsk, int batch_size)
> >
> >       rcvd =3D xsk_ring_cons__peek(&xsk->umem->cq, batch_size, &idx);
> >       if (rcvd) {
> > -             if (rcvd > xsk->outstanding_tx) {
> > -                     u64 addr =3D *xsk_ring_cons__comp_addr(&xsk->umem=
->cq, idx + rcvd - 1);
> > -
> > -                     ksft_print_msg("[%s] Too many packets completed\n=
", __func__);
> > -                     ksft_print_msg("Last completion address: %llx\n",
> > -                                    (unsigned long long)addr);
> > -                     return TEST_FAILURE;
> > -             }
> > -
> >               xsk_ring_cons__release(&xsk->umem->cq, rcvd);
> > -             xsk->outstanding_tx -=3D rcvd;
> > +             if (rcvd > xsk->outstanding_tx)
> > +                     xsk->outstanding_tx =3D 0;
> > +             else
> > +                     xsk->outstanding_tx -=3D rcvd;
>
> Does clamping xsk->outstanding_tx to 0 mask underlying regressions by
> silently discarding unexpected completions?
>
> If the kernel correctly generates CQ entries for invalid descriptors now,
> could outstanding_tx be incremented by the total number of submitted
> descriptors instead of only the valid ones?

Yep, I'll fix it.

>
> Tracking total descriptors would allow the test to use the existing
> timeout-backed wait loop and eliminate the need for this clamping.
>
> >       }
> >
> >       return TEST_PASS;
>
> [ ... ]
>
> > @@ -1293,6 +1289,14 @@ static int wait_for_tx_completion(struct xsk_soc=
ket_info *xsk)
> >               complete_pkts(xsk, xsk->batch_size);
> >       }
> >
> > +     do {
> > +             if (xsk_ring_prod__needs_wakeup(&xsk->tx))
> > +                     kick_tx(xsk);
> > +             rcvd =3D xsk_ring_cons__peek(&xsk->umem->cq, xsk->batch_s=
ize, &idx);
> > +             if (rcvd)
> > +                     xsk_ring_cons__release(&xsk->umem->cq, rcvd);
> > +     } while (rcvd);
>
> Can this loop exit prematurely and strand valid packets?
>
> In asynchronous modes, kick_tx() wakes the NAPI thread and returns
> immediately. Because packet processing happens asynchronously, the hardwa=
re
> may not have populated the completion queue before the peek() occurs.
>
> If the queue is not yet populated, xsk_ring_cons__peek() will return 0,
> causing the loop to break instantly before the valid packets have actuall=
y
> completed.

Right, my local AI also spotted this potential issue when running in
the physical test env. So I added:
+       usleep(100);
+       complete_pkts(xsk, xsk->batch_size);

Thanks,
Jason
