Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFDA46AF31
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 13:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784036364; cv=pass; b=rvyrYxGN2vwVROf5uZyt4VSAhEOwe5LSiRpdVOqo0a6G4PnU1f0qZrb3J5H/W2DmtsJL62SiDO0myFnMlRN2W3O0EhCrBHpv5WUr80XF17OLhbdbrgb6Hfdq/CT7iuucLDXtrsB57Q8+cr5ctbzVe8izvxvmj9zNgBIqIfEZPTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784036364; c=relaxed/simple;
	bh=DwIb33/MUbNJ6SXd61hMtjAJP3vWKRsR+k6fH0eQFvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hTI2Ban5V3N4pGKhq8AjrcffniJ090T0+QBrdYrGLI7QQajAltglqPnOGC+5I6isrt0Zsr+fXT86En3AltnrNprTjS69oTInVx2jwJlpvPPI7rTeAa6yJ/KxfnQaH1IZoox03awgmma0nkHF6M8CeXT9hA+DUSE1fQjoeKCmSv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIylfxLG; arc=pass smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIylfxLG"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-973b676e5f5so475035241.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 06:39:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784036362; cv=none;
        d=google.com; s=arc-20260327;
        b=OSQ04ZqenMH7xug6g30redBo/EEnOKy9j5x9QHC0HgSS8PyD6AGLjfgoYebix/iT4N
         KQ6Ofoglqcf+BqqPwX/gBkvOUxPL26fI5DFeXPa6znHCtLmcd14eNpW3gNM/O2b/h0ZK
         yM0KcxbnhhDxLGScn55RE6WcAI1oI/r+IbWdc+QYHshpk+xaVkDu/2FzI9SBxTFubO0q
         EiT5L7a7v73sH/oIYebQKxN2FYl07GK7ps94ex+OLDlwWWSvpHeYxH6Jnc/v1q6g6syd
         IItFvXc69q/DXLafEMhsQIVyoWoFd7J+yl6crR59mkyS/jGSZoxvJzcx5YaPFJSj75sC
         Nj5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DwIb33/MUbNJ6SXd61hMtjAJP3vWKRsR+k6fH0eQFvQ=;
        fh=CcQ86f49oGl9srj5qqX+VrnKgviRK+XiAGNNzPzdATg=;
        b=sSbvvjoL4PMdTiRhQMExXp+avNCfg7lCX4sghuuqMUQ9+jDkP6dOAHR6K1dPcrgwhu
         A9QG1tljTOZstq9NJtodmh29mu+uHMFERlYhNImaLBX5u5My6I41HN5apvWwSfvIyoM3
         kJUmGp2BXAl827yoCBp/gVRInSiiNS/9dLwgblGC4alGdzV2zTFyKJef3S663s/6KDUS
         TtUjehCUO36B4Xye/verA6d7knI/qnitf9wAJBjDtoPjAnewWjz0V8gcDmTaGSqAPn1Y
         RtRfy2i4CIPVEeRteXQeKxO9CShAulqPMA5rkHfhQedkMFlcLTMB1kHSs/gIMexVnrT7
         9DzA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784036362; x=1784641162; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DwIb33/MUbNJ6SXd61hMtjAJP3vWKRsR+k6fH0eQFvQ=;
        b=mIylfxLGsEiHe/RT2etgrMBwKGNxbx/6NIjfYO/w7nHh5AQISM1KaxK4VtCc7O0BR8
         yVz8A8gTXZMO7kWuudpLGXp0+pl6mIWp59TQalWv0SVJGC+2mte+G1glCePujAzBB6sX
         YjFZP5VbWRS3r0JNF+KzF4JeesusKKwafjnww7NWlNtqR30ichWKFYsF+1v08fVVptyg
         PcSVn/nPqG57V4crLH4BmCZRlX3W/VUXYIjpf1PSNq+oquzmvs9GhnvngBX9mHTAttg+
         YyLNTx8ucyW2mSk6PbHKITbi0wComVvCaoSzUr6rTdHmcLZNiGYIHmkAmBrjQ4V3tEyg
         e8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784036362; x=1784641162;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DwIb33/MUbNJ6SXd61hMtjAJP3vWKRsR+k6fH0eQFvQ=;
        b=L/FOOk2hPEBUdtEYb/IEQdo+/NebLu2m9jSiF5lKkoSbWQeRj/Lvwj3z06qDguoZ2c
         KNy3yhiRdnZF+8haMzxW1XOpAgbkx4iN/RmcXqOgCXyWWnOlFE0+EmZqv2Q/9o+fVfoc
         gqwEWZmk7vXyOUHkE3FUgDq3lM5C935G4LBM1EgiONN+7Ns8z76prEnnIYYvjoR5UwgZ
         dWHLB25EtwHkeR3GMLGExLCd5kZn65iRXhRHJ5t/FGtM+vQdX+Gl4jXGBc+jbJ+a+FVm
         eHLvRXdY+WumCNrP6YAUu/PpFDWmQ+LrxL5n97zq3ECoqeBBu0SvU1oMP5//b7qhBVWf
         zDFg==
X-Gm-Message-State: AOJu0Yw24ZsveiLtXyBZJYmyEFTachU7hvP8jZwo1omTlihXhIbEgmPi
	fxatKyZ/VSznQ/u5zrB5yrYjZCqbA6Y3paEl3QLIl6NR2VdY3nKeoah/Fdmp5FY93/0OOUzK8nr
	n9wlgoWCtu68y/E7nzbx8dTOshfE356KpzkCgvVI=
X-Gm-Gg: AfdE7cmbjV432uueuO7TwkYvloZvjpgE1iqP8p8HiYqeh8dzkeZpmJXq9W0gtd3E/t0
	C+Y9OIKDsvh+um/pGvQLwR+HR1gpG5FU6t783zbDUUVVgMmb+JI3FSAXpZxNHCKT7R5OqgdiL3y
	JPJVNubbD0xMN87p5SxP9urahiofAJo7D8fzHFxUgPFnsuXG/N+D0y/pWULHhYPcCzYmsqnMFgS
	56f41yXhgZyS+4Opsd9a8q5LUuNuCLMA0aePqa6KWxS75RPGGRy5JZKCOE3wfHHy5Rzn9fXVTM=
X-Received: by 2002:a05:6102:441d:b0:643:80f1:350a with SMTP id
 ada2fe7eead31-74533b42f88mr8627150137.2.1784036361731; Tue, 14 Jul 2026
 06:39:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260714120052.255085-1-chlgustn3171@gmail.com>
 <20260714121819.5FCC91F00A3A@smtp.kernel.org> <CAO2ma08Pap6PZKUV7iEpvu11zaKrzMK-cgBLBYKJEEfGH+0=1g@mail.gmail.com>
In-Reply-To: <CAO2ma08Pap6PZKUV7iEpvu11zaKrzMK-cgBLBYKJEEfGH+0=1g@mail.gmail.com>
From: chlgustn3171 <chlgustn3171@gmail.com>
Date: Tue, 14 Jul 2026 22:39:09 +0900
X-Gm-Features: AUfX_myYjaJA6AxmS1f1aMv-_YdelHEt1X3VS9D4jvlYoByEOFtdLcCWT5iVDmo
Message-ID: <CAO2ma095Hu1kOTMds9yHqTvwde8Gu+GWOLUst5U2eCnSffkm=g@mail.gmail.com>
Subject: Re: [PATCH] HID: input: allocate input_dev name/phys/uniq using hid
 device devres
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding maintainers and mailing list to CC. Sorry for the omission.

On Tue, Jul 14, 2026 at 10:33=E2=80=AFPM chlgustn3171 <chlgustn3171@gmail.c=
om> wrote:
>
> On Tue, Jul 14, 2026 at 9:18=E2=80=AFPM sashiko-bot wrote:
> > [Severity: High]
> > If a userspace process holds an open file descriptor for the evdev node
> > (/dev/input/eventX), the input_dev will outlive the parent hid->dev.
> > When the HID device is unbound, devres will free these strings.
> >
> > Can this cause a use-after-free when userspace later queries the
> > name, phys, or uniq strings via ioctl (e.g., EVIOCGNAME)?
>
> Thanks for the review.
>
> Using &hid->dev here is intentional.
> Using the input device for devm-managed input_dev strings is
> problematic; see CVE-2023-53454, where the allocation was moved to the
> HID device because the input device unregister path may still use the
> name for uevents.
>
> > [Severity: Low]
> > If devm_kstrdup() fails for phys or uniq, the code jumps here to the
> > error path. The earlier successful devm_kstrdup() allocations remain
> > tied to &hid->dev.
> >
> > If the caller continues the device probe successfully after this failur=
e,
> > will these strings be leaked for the lifetime of the HID device?
>
> The name/phys/uniq copies are attached to &hid->dev, so the clean-up
> is handled by HID device devres.
> However, if it is better to explicitly unwind, I can add that in v2.
>
> Thanks,
> Hyeonsu
