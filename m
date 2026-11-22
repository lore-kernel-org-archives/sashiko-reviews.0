Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795329732;
	b=jMjQjacLtnrmOi3U0xxfDX/YYVT6xK3fzi1LlgM2u++3ezdN3UDqhfabTvE8Fmoa7KcB
	 rvp/4rdTaggTtZiIvhZ/H/sSZEE4an7a0rpTi2z6JEpH/ZLzshUoMDmEzuEgWNpUnTpFc
	 Qr8Of0P/rUHa0w4058ua6NWvXtRFwlEPkLgctF58Xo5Y8zDdI9doweBUKvGwShbn3isRb
	 ie9vXC4YT9VgjQR1dCrJtBdqJgRZTk5pFL4MMa2OoGPueP1B3VN37CXe5mglK4+oeuzLN
	 3ICmsmwPSrxqU5CTWEsiUy2Zo1aSO5TzsU5PUj8NdSUy/kWkKBkngXFzhR/NPcFqt7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795329732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=uFwt6mW+1RfJR5QBxZ88YeWE43yBZuAMkFsXG5rT/+k=;
	b=nEcFYRwYx2fX8Tn3fltB8DKXhiFFqf/xUOfXj9DR76u0msaUadh9wHF+lZ7rgrqOuQUq
	 M+svWHMnLbEexJWUNUT3zhpo5AaBfUivpxC05cy0fAMl5QVKVZhri55f2tjRV5qdCmdGc
	 Nsd+i3kcmN8PuEDwqRfH/8IWIanx+bKQMW/k9Ck78Erl2Rp7h4llPKDCOkZdd1L7v6LWi
	 L5mIP3L3Hd6M6H9g034+PleETkZ6Ke3RwrM0rgwdCsDwXpwuYjckKP7nA7mjuvdWAJACL
	 0/47Ed7GPt6H5opIj1wBvJ0F4h8AKAjfVCWHBEFRT4Mr0Fjy3qZriu423rqsiATRO0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=enser.io;
	spf=none smtp.mailfrom=enser.io;
	dkim=pass header.d=enser-io.20260707.gappssmtp.com header.i=@enser-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iVtx4r9G;
	arc=fail smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1E2606A32A
	for <sashiko-reviews@lists.linux.dev>; Sun, 22 Nov 2026 06:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E1E2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enser.io
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=enser.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=enser-io.20260707.gappssmtp.com header.i=@enser-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iVtx4r9G
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67dc3a2a278so220060d50.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 22:42:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795329731; cv=none;
        d=google.com; s=arc-20260327;
        b=P9C6CA4GP8vseLRiEDSk8JVsGKHxoipOyC1dkMLaRwwmXcacI24D0o5PmTpgS2y+uG
         dAj3bXurwhd7u7MP36PnhkJkvruSk7JyO9BFFdbu9umqvVD9dKeJmRE2qpEUCpoEnEBm
         pvGxeR8err8rMH4XLjwhSLdWKI54VeWBVc3d4IMuZz5QjJKAiqi3CSkniqIt5+VxXcDi
         Z4+kiLFE/Adm4cdr66S+A0SszYSHZ7FIIKtgDDGNgfN4wjSB+ubdukd7p7sqRbptcD6C
         PKFqQTeBWuKmxb7xLpjY7aX/M/6hlpkDd0d0Td82zr7wFAT0pJ4P7UnKC33Rq9yA3ewa
         jpzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uFwt6mW+1RfJR5QBxZ88YeWE43yBZuAMkFsXG5rT/+k=;
        fh=5hiyMW3zTy6f0deBmE7Hi0iLsyarFZFW/iW5KxHjKZQ=;
        b=cwfMd6OFIjwXsFSzfV8+mGNo59toyiEKMCNWQbGW0vk6mnkn4w9Mv3hbCDMqWpeXWM
         JvU4F7IiJd1I6eIFlA732B/JN61ZY+xGg7wA/D0PFfuhuOiRNj3G0Sd+2muAl0pWB13l
         7meS9Tt1eeYsnnytFcCTlQC5qDOlWWOhl2fNhGuvJdRpu/hpakaqYGxWOvN9Myj776oQ
         MwKYgil+Htxs3AaJADHz/5p9H6JSgRhmMgKqP/uh5dgzm6+B9PYfwOBq6uhAo6CRGsay
         8Chg6Os9PxmjPrP+5BJ3MGJV/STi6T149BqYy1UdjjxDnXboImMWeX5FRmXJ/DmxqOgm
         6liQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=enser-io.20260707.gappssmtp.com; s=20260707; t=1795329731; x=1795934531; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uFwt6mW+1RfJR5QBxZ88YeWE43yBZuAMkFsXG5rT/+k=;
        b=iVtx4r9G06qspkegzPeYsjK9t4EbYBEP8/vZPTGUo3XSgns/MyZpGKJJctitpdvxjt
         UKn29Q4yQm3FROxNpzapXVfiyLwB0L78rMQxmOOl+zbHzfeImqHP/tTsUeIlfORbZqr7
         zC6xfAb8CLDvbuqeXu+PVb/10gspkgzCsIzmizLkXsZSuMgsxO986jTbKwe4Cw1vbiwo
         L5yFVcb18nacJ5FsLGyK7cMj8fjwDnQHA5vWR+WVEQwFypwNtU0HkJGL5fxFEROMSkgY
         eMnTTvyxF232g83J9jz2qA5nfi5TjfIOueh855hDQmjN8EqDbiy95vZLWre5tXwky0z4
         yGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795329731; x=1795934531;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uFwt6mW+1RfJR5QBxZ88YeWE43yBZuAMkFsXG5rT/+k=;
        b=Q4U6hDrQp/GjoGXCVUdGBy39XC5H8HGraGwQzV/7HBpcvJ+U+HbAyhtz4Ld4dnz9zO
         W0u8eAj5To52YVjTy79a7u88PnvJ6Gv+du6nlpgbOXPnA4C8fXKSoEAZnaSptOtfLF33
         7C3s8Kg6qOqZslIP57cR0lb4OJCoC5Tf1rY61wuIqKTy8wajazOUTfn4SydjMrWqcSav
         ODDNyyt5R55hWozcoR/LZFsdbZqEoExl7Nsg+X3AuwyFK3x296vg1293yPaf/Opf0Izr
         qT3qoR7sL0y3eGezcOqfGCIff2bergMTm+bgEDujeAwzaw0rlP0MFOMYqcDWLj0iwRZs
         Ls9w==
X-Gm-Message-State: APuU4Z/tk3+jDGcyUrLTcq8pa1ofqVU2bEgeA7jjCUNL/Wd5K4ykUNLt
	BIBNpO6lOWtX3wdXFben62l+dgbx/bgFJf8ntSmVYO6KE+/sKFZDEPm+Pj8PL5RMq1IaiQIPnpu
	EJCC95mafvXvj5Pft+3JwaMYtbaENJCE62CS7F4Cppy+90l9HgijuNFL0Rg==
X-Gm-Gg: AZFdTZd8yRLFfcVdTcP+ngsVsRHyBq3oFqvtEMahfSjm8+5FmCQZRXMxb79MYuJUGoW
	vMZcILtIjRQgMzL77ju3Tt8oL7yRvuzSRFQKN9DYFY3MqhQgrixVdydpBjga8mVUg8vo4ZhDNDZ
	UotX20c1JkU3uhrMuiCKutoiTQXvJ/qtU3ecS1Hlw9dPi3KIROUdygIQGbzuFwli0QO7dF5Wd4C
	3MPjhrFXQ1TdJNdeuvdTo9lu1P4a7xABf73K1IInlhlSthU5uouut1CdsqYvfmqqkuKUZslPEuk
	kfBCaDV8TeXKzYX+VVGRRenSpkxG4Fo0d3eB+SbMjmyrofYMZjO+60BeAZyi5amb1o7FEBpb8kX
	gd8WTp4Drxv0gy+mv1tewrqf5i+AZ4boK/8wbapazRjCqr7oBOhJrRqGvEiw=
X-Received: by 2002:a05:690e:bc5:b0:679:8c5f:3fc6 with SMTP id
 956f58d0204a3-67df43af88fmr6006818d50.3.1795329731209; Sat, 21 Nov 2026
 22:42:11 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122-b4-rmi4-wakeup-v1-0-1b662be4a9d6@enser.io>
 <20261122-b4-rmi4-wakeup-v1-2-1b662be4a9d6@enser.io> <sashiko-outbox-227741@kernel.org>
In-Reply-To: <sashiko-outbox-227741@kernel.org>
From: Erik Peterson <emcp@enser.io>
Date: Sat, 21 Nov 2026 22:42:00 -0800
X-Gm-Features: Aa3M54o4H3dZxCmAiIO7gvw6DhWgTDlv3S5qgVksMYPQ1wzHp1Iq6bG55ke5jY4
Message-ID: <CAOY-3nAwYxgAeu1zUPOBO_PQtswKtsEOnV6a8hfnZf312ALT6g@mail.gmail.com>
Subject: Re: [PATCH 2/3] Input: synaptics-rmi4 - keep an I2C device that may
 wake the system powered
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=E2=8F=BA (Resending as plain text; the lists rejected my first copy.)

  Thanks. 946c8432aab0 is where rmi_i2c_suspend() started disabling the
  supplies after arming the wake IRQ, so the tag is right. I'll add it in
  v2; Dmitry, if v1 is otherwise fine, could you add it when applying?

  Fixes: 946c8432aab0 ("Input: synaptics-rmi4 - support regulator supplies"=
)

On Sat, Nov 21, 2026 at 9:23=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] Input: synaptics-rmi4 - missing Fixes trailer for commit
>   946c8432aab0
> --
>
> commit 83b2656443640f5726e0dae2d6e9d52155752d68
> Author: EMCP333 <emcp@enser.io>
>
> > Input: synaptics-rmi4 - keep an I2C device that may wake the system pow=
ered
> >
> > rmi_i2c_suspend() arms the attention interrupt for wakeup through
> > rmi_driver_suspend(..., true) and then disables the vdd and vio supplie=
s.
> > Unpowered, the controller cannot report a touch, so the wakeup it has j=
ust
> > armed can never come from the user. Where the attention line is pulled =
up
> > from the switched I/O supply, cutting that supply also pulls the line
> > low, and that falling edge ends the suspend by itself.
> >
> > On a OnePlus 6T (S3706B, attention on a falling-edge GPIO, vio from a
> > GPIO-controlled fixed regulator) with the touchscreen marked as a wakeu=
p
> > source, every s2idle ended within 3 to 4 seconds with nobody touching t=
he
> > phone, with one attention interrupt per suspend.
> >
> > Keep the supplies on in system suspend when the device may wake the
> > system, as edt-ft5x06 does, and skip the matching re-enable and startup
> > delay on resume. A device that may not wake is powered down as before.
> >
> > Tested on a OnePlus 6T on v7.4-rc3 with 'wakeup-source' on the
> > touchscreen node. With wakeup enabled and nothing touching the phone,
> > "rtcwake -m freeze -s 30" slept the full 30 seconds with no attention
> > interrupt (2 of 2), and a double-tap woke it (2 of 2, 120 second RTC
> > fallback). With wakeup disabled the supplies are cut as before and it
> > slept until the RTC (2 of 2).
> >
> > The code and this changelog were prepared with the help of an AI coding
> > assistant. The submitter has reviewed both and takes responsibility for
> > them.
> >
> > Signed-off-by: EMCP333 <emcp@enser.io>
>
> [Severity: Low]
> This fixes a bug introduced when regulator support was added to
> rmi_i2c_suspend() and rmi_i2c_resume(). Should the commit message include=
:
>
>   Fixes: 946c8432aab0 ("Input: synaptics-rmi4 - support regulator supplie=
s")
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-b4-rmi4-=
wakeup-v1-0-1b662be4a9d6@enser.io?part=3D2
