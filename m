Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E194502F
	for <sashiko-reviews@lists.linux.dev>; Sun, 17 May 2026 06:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778998564; cv=pass; b=SNqIBaMXAWyT0Y8vRqJrIUf+ekavpIIDnv3EGSGnAhP3QzHkQgtyp5+xy2iqI/s8IMTkCA5mBWsFm/p74+zdpjA2NWPWnxe0mHJUzbC03k43aYKPCcmV3waKuiVqWZAh2HlRi0VNbQqPuzY/+jQiUjEOgpj+0U9Vj2RMPW3iY2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778998564; c=relaxed/simple;
	bh=KQwepD6izLpoXVuCEseHVqNDIYjLt7x9FUc+tmd2nvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LWr+A2yjZnCI/WuoYXZbA9Od5OGqrqxJkGP6PVMXwHrTIJb6143bENfXUIwCI2gNWKdEfQKLNltwdrHVSgPKOwGsdzohULz0wcjKu0FZpUTQxJpr45GF/3qCXwFlNkMTtq+hI6AuzirRBoaca1E+DkpN03cNDZ64GTCm2W1AIxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XMV/ih4z; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMV/ih4z"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a884815606so1632830e87.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 16 May 2026 23:16:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778998560; cv=none;
        d=google.com; s=arc-20240605;
        b=PFtmCfY47R0KvWOlL/AGTf8sIA1nhrc7UY/x8ldLovalFsMiGcX6gBO2JH+HbVDqaa
         /p6HAP9Czk78JSv35c4opTmrMoGRCmw9RzBhxZPWuDgf90EHSOdSmaLDNbGCI1jBxHSA
         OFbCYZ7Xrx0uGcwOpuBf3wwGws1aWk3idc89K4vXl5FTou0dMTB/BFwGI752RJc2Jpow
         0HvBco6vDQthGpDM7B7H9jIzMhZGo6hSubTUgGZoJrXE3h4DPsKlEY9uBaQ2KlVClvyQ
         PYFtbB8uKXZBWw6lNACJsQhkylv3OtXtKiOlepUp2e9Lbh4+b09+fC0hkCSDeDuLgAPf
         PfPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cZb6AJaZ1xadPD91ePgoZT8bZhlU06q0reAG9tkJInc=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=IeArOL5VwmwXaYgBSe4c6mgGBlx0OeZT64pQikmvWzZqAKl6rAzoupao4PK+ZvvUfp
         MFgJelgcCucvkvI8JwxE0fgmlnvO0X3cB7wd9YfRkH+jD+pYK63w+yXOuUogQUSG2n2r
         ZBr4Ix5BCgHkXf+6oM3lSX5EDUSy+idwhNXzNBMDu56ClyKqg34rKazAwMBIUCWxP8U/
         cw4y84sf54TqrYG8DuwOsHZEFuw1nmqpWk1/X21ONM0uPmNXX86wMUNRAgH+kO0C5wR4
         wRtkf0WC2z37o9+F2ZYmaCxtJMcxPdVfFPJRqeDCcDsF3Urad5Pvr36Vq6RK4D6pRz6d
         PZEA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778998560; x=1779603360; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cZb6AJaZ1xadPD91ePgoZT8bZhlU06q0reAG9tkJInc=;
        b=XMV/ih4zxEod1oUyPXqMzz2IJ0GK9TcbT20zx3ZikCLJVzqO4u/y7b43eLd65jaL+J
         8FgNGvp1uzRbXZ3HMTqGwQrHZR9zzowXSq26JZwUo7NyvIsFssb6Nz4OKwljwqh7geNA
         ErySP3CqFeHct5bDotcUsXwYqcUNFlOiK5fnNBjB0Al7V+L4HPER4DxeYPocuaIhSquy
         Jcqr4yqwtVW5hiVxvclWqipix2EZh6RriWj5l7MKdh+4KAeEsAXuDxMpKndKCAyxd8YX
         paBvN6NqFDIlGHqMjlcFM0/8TimgjJLFjLI2RXlNuCpV2anPiUdhhD3xQGAuegQPkJT3
         C6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778998560; x=1779603360;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZb6AJaZ1xadPD91ePgoZT8bZhlU06q0reAG9tkJInc=;
        b=kxYLUfSTfEqSHrEGdnzv3QF/gV4Y8aYSWOrfy4ksJ2cXLZDusRT19U16rKY7VHhLJu
         /irLH/W4X4wVaqbA3ZC8otsqd2uNhI/WKen4HW5ehgQGb+CUdYFlgK9wiAUym6r5OVNV
         /l6vhG78iSn4Kd9O8xypxh/29g4x1UC5JLwLh7BMBbmC4gryJS7jShXCsTHi0VpUlHNg
         XhFPzFfUJtKOHTHPmE0R0m0SkcFVjEYWVcRDPB8fk8VBZGwnPdf/3uc99z5V5KAzQeG7
         xKfMctf32vnLCprT2QfwvJyNa6gJyy2Lf7znvn7G8EvXK6Sn1RW3QNyuB20XzvTFbYWz
         Cc1Q==
X-Gm-Message-State: AOJu0Yz+kOTtm3vxxOLZzNh2izrlU5wrK/JObhUgT+/640u5r/a6dAHU
	sGnlL7qAMO7XDhRbRKj4sov5bwOx0TRPXmfrWCgbpZ5YUIUP84SX8iEeZqCtulxVkmQki8rpLAg
	zip7PKp8aNaQ3HO+ix9G+am6GnOErOhr/aNeCaqlepg==
X-Gm-Gg: Acq92OG1s60zssOFMuBqx9iQPE0AD9htTQTEgi+Tltd9v05k/HncBpF2bGPbb4tq4Ns
	+qVzL9IPsBMXclqFUUmItlhB4CeRzPvBerBpCNeaAJi+wBazJlJAd4LAuGUYZXOBplS7r5nuuS6
	J9858BKMfQDLQUHbwEDeS9++e6METvtISf537UM9OWPRvFIcBDm8w8gx64vmRsKcbI41/JfaYQe
	unccPl/+rq9z8wyoI+SLosyOx3ZWC23PeorKfuJ4imQBu+Gt1V1Z5nU9+4H+h0CxPcjucQN0/mC
	i3PTZ1XbodWH12RTWc3hsnbgRnUy/VxKSFNzRFfCdkrvtva9Ag==
X-Received: by 2002:a05:6512:128a:b0:5a8:65ce:e83b with SMTP id
 2adb3069b0e04-5aa0e60cfadmr3117551e87.7.1778998559852; Sat, 16 May 2026
 23:15:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260515123018.80147-6-kerneljasonxing@gmail.com>
 <20260516123128.BA67BC19425@smtp.kernel.org> <CAL+tcoB=cW0tuoJLfoRKoNX2rYSTcF_c09nyZqq0ZZQEJHJP9A@mail.gmail.com>
In-Reply-To: <CAL+tcoB=cW0tuoJLfoRKoNX2rYSTcF_c09nyZqq0ZZQEJHJP9A@mail.gmail.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Sun, 17 May 2026 14:15:22 +0800
X-Gm-Features: AVHnY4IzglYJ7hA4FzDnVyoltczY2JD9hsjiM39e-19Twt4_xVRlot1zyCdw2n8
Message-ID: <CAL+tcoD0VbrgdZYv4Nj0kgvon6RUXnXbWjoxcgCQ6qPanqR+7A@mail.gmail.com>
Subject: Re: [PATCH net v2 5/5] selftests/xsk: fix multi-buffer invalid desc
 tests for drain_cont
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > > @@ -950,17 +950,11 @@ static int complete_pkts(struct xsk_socket_info *xsk, int batch_size)
> > >
> > >       rcvd = xsk_ring_cons__peek(&xsk->umem->cq, batch_size, &idx);
> > >       if (rcvd) {
> > > -             if (rcvd > xsk->outstanding_tx) {
> > > -                     u64 addr = *xsk_ring_cons__comp_addr(&xsk->umem->cq, idx + rcvd - 1);
> > > -
> > > -                     ksft_print_msg("[%s] Too many packets completed\n", __func__);
> > > -                     ksft_print_msg("Last completion address: %llx\n",
> > > -                                    (unsigned long long)addr);
> > > -                     return TEST_FAILURE;
> > > -             }
> > > -
> > >               xsk_ring_cons__release(&xsk->umem->cq, rcvd);
> > > -             xsk->outstanding_tx -= rcvd;
> > > +             if (rcvd > xsk->outstanding_tx)
> > > +                     xsk->outstanding_tx = 0;
> > > +             else
> > > +                     xsk->outstanding_tx -= rcvd;
> >
> > Does clamping xsk->outstanding_tx to 0 mask underlying regressions by
> > silently discarding unexpected completions?
> >
> > If the kernel correctly generates CQ entries for invalid descriptors now,
> > could outstanding_tx be incremented by the total number of submitted
> > descriptors instead of only the valid ones?

Well, this assumption doesn't always hold because
xsk_cq_cancel_locked() cancels the desc from cq. I confirmed this with
testing - switching to outstanding_tx += i causes 6 additional test
failures.

Since this series fixs the wrong behavior and publishes the
invalid/overflowed desc into the cq, outstanding_tx is no longer used
as the verification in selftests. But it is still useful, like as an
indicator on when to kick the txq.

Thanks,
Jason
