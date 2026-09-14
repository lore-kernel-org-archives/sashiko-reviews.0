Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438F943CE7F
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 10:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382555; cv=pass; b=VyiArIKDbaAOrwQh+aPdez+4gkedjPEu7cowMxHXLxx6rhGgk5CUEBJND2GQkOZA2jazvNazVbF5E8UvXIHJu3cgJJkC4Kg4wy0YcInrhmTeUejsBXXMUD0DyKPpuzmzMfHL7/aTN0o43iVtiWN8ObeYUa0eZj09QnnYgR9bmxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382555; c=relaxed/simple;
	bh=aH3qUfclucTu65C79a8F+WYWXexvD6ufiksGY7byA4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NquXNLxT83mopkgb00YHgGImz3HqxU02pFRoWAE1Y/3MZ5ZBiuM8ZEjQ2B7TQJxmZgLDDCsBz3LeBgKMV0PZDG/mNH4GjJqN2ShTKY2fa1O+FM1TYnoRhGGGxCk0bJDHm+/JzUUFNXkDmyV9p94y2Q9nhzC9KcMSqjAcSiYk6R4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=al0fd6EF; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="al0fd6EF"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43ac6090so12437067b3.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 03:42:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789382553; cv=none;
        d=google.com; s=arc-20260327;
        b=N6a1kScSCwDu88dzQBeAsXcLhiR30aWc4g1Dcu7z5tkVbpXxj3c0RnVlzxdUCmYF9C
         XBozfGVVTcXJH0GFSiCT/I5VmdIJGGjreQivqzUHwxJaLL9x6OpVjyTI5xTDdOHemZ5I
         PJoSmbVIVA7qzUnrVKxEh7XIo47beLQquQfbCdbQr9ef84AlD2e3eWeNR7a+Gn5H6Rxv
         j77T1lFf9yIo/Me4OTYYxBVwYC3BWNP75k394uPhHnsuOzSmSDqjuihsH7JAfLYVBLD4
         HK2RT75/a3eSNNx2wdghwmguT5lhKrpU3TBe1uL5E7LoN+BCLqe8Oj4t/O0Nn/RtvBcg
         FN5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aH3qUfclucTu65C79a8F+WYWXexvD6ufiksGY7byA4Q=;
        fh=r5URhQl6whOcnDbP2Lcwh2ZUr6KpnezK+hz/MEOF1jk=;
        b=T9ZClokLRTA/kdJK0vPCWYsnI0dG8LhjKLxrDnhyOB5nZ/ld5C2HXsy6Mr05m2LuFT
         ZubzyCBVbksLYgmiF/YGdMvKWp3EKHiMFxlWL9bPS9If9hURUYyG4/386Dq1loPXmS6v
         xzlIJQNRjgqLiqR5yiqGtGm10y6VMo8EshnxwqofxlxgJz+XTXjZdjXUoM5TPFPhw64t
         26YgitMyMA5ukSyKVTNBANV+vUbbahgWXWE8hH1PjWXsDVK/hHucXWoDgBlNrmooakpW
         TUp6z7icZzr7S1MM5fOonegRwdZkCnojk5ov6pebICckBb9XOaG7ouCRkZ8cT34p/meY
         Tv9A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789382553; x=1789987353; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aH3qUfclucTu65C79a8F+WYWXexvD6ufiksGY7byA4Q=;
        b=al0fd6EFPWICFVASTBHOZRa9tEw9TBbKkVRCu3e4PmfRn1Fc6I6mZNw5VC5ka1ibCo
         00RNCr00psQt2Erx1jOVVycsR1CaMr0xK9PkpVXr2N1czgaETDR+KoDfgfEJNXHYQ4/5
         WpiRSuPHCcwyVI9BTVfaaYMl549G1MKC8km9U25BivBlJn6uDP58yzcTZHwO198ihuqj
         CRAELf6BoFbQruixYqoGSFzOh7cVYz3CAJPnmh1fBK1nGg3XVPAkSh2o0hkcuV2dkP5+
         3YuP9b1nzhnQSS1D+1bZNcu+VjQ3OXt+jhptr9MMbPFPRqTj2xipo7Q1yft7S5s2YPWd
         B86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382553; x=1789987353;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aH3qUfclucTu65C79a8F+WYWXexvD6ufiksGY7byA4Q=;
        b=QDd3xjJgK7V/Q31ZcVocvBMf5ZqYTmBRPnqkaofgu0gGuASzqEaePZPYl+xq/aAiVk
         zvp0IYcPaniLJcOkx8AxGV0C9oA3ov+LQsci/59d4NZ2lkW8MLYKCqaYcKHmBBqO1FeS
         y984CF4hXdusuIq5CpxkjmfH/8fcc/VJVQzNlmkvHnch+DaXxFlxh0rTJz5jd75JtbMY
         /W6oF4cNdPELc2XBMs5OoRNzmlV3Tm6dzXuHvD/WR+Nr7I5sM0G0uXucyzYj/yPjVZ6n
         uQQqtFZTo1pEjrftGEb698bwoIv7qJVeixPp/Lfwso0lar3iWmlOsuT2LRTu+hg7358R
         /+HQ==
X-Gm-Message-State: AFuF++mhQsL/idSx7JuZYs0Cgp/x2dps5WKLqpY7KMEt8xHWfPT9pslc
	F7/+jvqQwi5zmhqUGssGVUuVuGw1DkrIhIWT35ddhdmnxK0cl9kf+8elQJ0Ap+o2RwtxV6+ub4B
	yR0jHlakPldvCsJf+VC3052NyFx6B/vs=
X-Gm-Gg: AYBFou3ZcMcxm0qCDV7tpJdaKmZiBHv9kQGGyHRTPEDPCcJeFMKeRaGvNI9YNwMq84k
	MqRtSakQJUVLS967MF0KI0ABz+CkDJsBelZLxNUCwfOUhd6g9D/gRWa8WVDmGDp2WACRQpRjx4k
	ijbeb5ikaXgWwRKxJwcg/z5yT+na++FSBaKbIuGYw3H+ws8orKXqmZGz5FB3klVsOGXkH+8evxb
	9ndug3iaITliVe/3cUg9K8hNQZJQOBskpf0FUaaAjjLFjDVl5Qxvctub54pQ06Yz/QvI7aCB90a
	ScLGvmFWg2yuOhBIDH5IAh1atUhGJIPLOdrD7Puj6IZNPK64EtjMGU36DgispjlMdssfyO/804y
	BvRfDJhdyCNat
X-Received: by 2002:a05:690c:a5c1:b0:873:5c7b:c109 with SMTP id
 00721157ae682-88d23a93ae9mr3186947b3.65.1789382553231; Mon, 14 Sep 2026
 03:42:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901155648.1538876-1-congnt264@gmail.com> <20260901160931.DD3811F00A3D@smtp.kernel.org>
 <fbb88a92-02c4-48cb-93a2-678ee169e88e@roeck-us.net>
In-Reply-To: <fbb88a92-02c4-48cb-93a2-678ee169e88e@roeck-us.net>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Mon, 14 Sep 2026 17:42:21 +0700
X-Gm-Features: AcwNN1Xp6V1imZJqUrnncRhJzwCc7a07hx1hIztm_bzgAQo-zBxQwj_SL_Ey-Dw
Message-ID: <CAJpJ=Gsj2-m6kCc-jT8KiP2tGUDxKZ45ZdaZ+HXvOU3wH_ww8A@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (gpio-fan) return IRQ_HANDLED from the shared
 alarm IRQ handler
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko-reviews@lists.linux.dev, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 1:28=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 9/1/26 09:09, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
> >
> > New issues:
> > - [High] The interrupt handler unconditionally returns IRQ_HANDLED whil=
e registered as IRQF_SHARED, neutralizing spurious interrupt detection and =
risking a CPU lockup.
> >
>
> As I suspected. This interrupt must not be configured as IRQF_SHARED.

Agreed, sent as v2 -- drops IRQF_SHARED too.

thanks,
Cong

>
> Thanks,
> Guenter
>
