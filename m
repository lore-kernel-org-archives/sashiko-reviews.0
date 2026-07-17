Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A232F7EF4
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 22:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784327810; cv=pass; b=tNOX2cGhV0wH6i2SoDYl3oIMeWVrxknx61srp8B371de0XAydha7I59t116wXSzw7XSX3+llO6cm4/agKSm63xVS3K8rtHvskQPrSz+v3S2dsbzryQmF7/IgBuGr7wEL9wmHatrxW5AVkYvPooTuLx+M4eNYeghblfN8TTFIT5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784327810; c=relaxed/simple;
	bh=eDv9Ms7BHi4UpLs/xou8L3EuVrqRPx28h9CcZ7tGmZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DmwMPLxPWmxBZRcOsIz6mDIErpsVPezbs4xe0aTkbBWIFftN2ubiFxKfqK/U9iJzg7rx5wdVRzxG1QFf8ZexmjpMyDwt+ShOswGTKOTcOBlVQqy8Oblb3GIZdCTHQ7XaC4F/k6F+JXbrrZpFWctnGslPFwV49dnrw8+h0Y8EaeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5C4yDye; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5C4yDye"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15f47e6297so528434866b.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 15:36:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784327807; cv=none;
        d=google.com; s=arc-20260327;
        b=cIkIo1b7jGGJwJCDQPJ1Li5mHsUWNaZZUixqKqY3x7R22ri489L/IcwKfgkJTaJXTM
         Tuu3123IklvPAGSFJsu9eHVE+7e84HQikYYQjSw1pHcNqilMGM9EdA4/BPkl2SOzr0Vs
         FqH3WZuiusD60ndpgKtiY6ba3p26L9P+ZGu6RGQw2jzolP0E9FVLmh5Oc2DLAEGc/gDr
         I3Hp5pkxwljNw3UGGzapR9Xt7slyIMEF7WLJ1nw/P34tRdlb4rEj0JVFWDzY2v8qOJc6
         MpglG0MqLjAGBta7AToY8Jir3nzNp8/0yBPumNyq+l29GJma1Bfb3qlhvVW0f1tvBCSL
         792g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eDv9Ms7BHi4UpLs/xou8L3EuVrqRPx28h9CcZ7tGmZo=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=sseTvTyHFHKHKGHfYo1S+RfDypneSPshpdWcHPKqSCpFP59fcSwyRLnS9x0qdzRb28
         o3vNYWjEYLG50RvUn/077ey/P0GalzQnPlmTcI0YCxzgKA8W8vDg8030FPxOeYaaaIp6
         e0Ko/5VWH/nCTL3ffO+GG9GyK3OCs31b+T4Voyz5uZ+9XqEoMcXgjoh3IPwYxjvWrj7n
         NH6A8k7lgov74GWJA44bpD9KjCu5fS5HTuaY95wX3iSomGuhVEtXE1uamFNFsUYcursU
         nAFGKpKc6PWr1F9J2Kxog3z03eVnRYxQvvyCRFARmZuypdCtFSTw1e0M/1BZpipoep6G
         PaSw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784327807; x=1784932607; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eDv9Ms7BHi4UpLs/xou8L3EuVrqRPx28h9CcZ7tGmZo=;
        b=b5C4yDyeYwUhwYpSdN3VKmJdWt8E1Ur+GNyLTt++21MgnGM3QHYNvBzKpgphSMpeVg
         pfEwk1KRcC3OBXw2P4WvESLHlK3M1xVr7Qa25HagBCR27bK7Q8n2PbMD4BbvVTuQSwsl
         S9K4eaqU0CCXjOzCjuJwcv6pUFvl7yK9JVPDnx8Ldo2PNIlkSBKipj6A8UB7ljM6YNQm
         R2UBGYL23WC4TSyPqJhydgA6cMcRT50UVmcXcjZ/lgLHeUY043y8tZ6/wUG3cCuKq8Gk
         /Kj5KMYVEjc61uvY4wzCqX/ydbBPrsnshNIfllgQlF/HuBjwB8wPIyjM9pywUinBBjN6
         WkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784327807; x=1784932607;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eDv9Ms7BHi4UpLs/xou8L3EuVrqRPx28h9CcZ7tGmZo=;
        b=BIK+zZh4wqRMK3tpNboAF69D3ZpiiP1LxAzm6NeMVvyC/Mi6JxqEl2DGAsk6mf39I1
         yWMUXM4vDXzlo+rnyXWv5nyIOKC8w8VArO/8C2tO21hPy9libMhO90brGZ2Sf9bo2uwE
         8Vt4elEiOUi63TQgX8j3Fd5TEAO8vhxgHeyXTOvlCdRiFVxTpbVMGHw7pSl18LKe82ew
         YQEJVtM6HtQFuifi34lEaMdEs9qXLrS5IvM0dpWiLQazrWWET2J0WfCDbmvZ3DG2Epkg
         LhwL36CzBMkRze/cOqFeFmXMnPEKQIbsTaxwfcrjMZqEGiKU+tOnBK57ywxDyNxk52eA
         vD8g==
X-Gm-Message-State: AOJu0YxJWDHU5sMKwpB5cnhpC0zhJJcuJxT+AMegX7QssNHhVUHXQ8Zm
	8PUrH3c1K2Skt3FTxMkpjGb3BD9OlO8sjjsqk3TrVw+/lAowcAsm+JW4/LD1XoF9vfqgEAIJc9P
	64AXFHynJzg5tj2LmeiGkM8SrFvfC6lkrk5z4
X-Gm-Gg: AfdE7clAfvuWcOCLdPoBS5aCCmHFJI1safQLsHYs6D6tDIh/Eznyz04YZDvX3wWD/F/
	my5gu1qm5Hr95kLQBZ9TSTaU6v3H0q79OfGbNcF7fKpCZWUmEbtZMSBh5nk+njbDsCLgKxJqy4o
	dajTRl1gurB4j0AETnKhoFaxDx6shw6lxI6dwKEstLTcQHb5SdExO1DKlaiugAQTffB0PnZxk2R
	F2dg3lVnX2dJ3pz/GzMMgy96BNFnYquwJX9Yr/uYEzGpEmac1dtv/3megN6ilJZ
X-Received: by 2002:a17:907:c896:b0:c12:6ad6:6398 with SMTP id
 a640c23a62f3a-c16b4854d08mr179515966b.34.1784327807057; Fri, 17 Jul 2026
 15:36:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260717190544.257306-1-main.kalliope@gmail.com>
 <20260717190544.257306-2-main.kalliope@gmail.com> <20260717191621.0D7DC1F000E9@smtp.kernel.org>
In-Reply-To: <20260717191621.0D7DC1F000E9@smtp.kernel.org>
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Fri, 17 Jul 2026 18:36:35 -0400
X-Gm-Features: AUfX_mz3U8rrl-xwWmug0jkD8niv-ww2HS3xyRgdhTsJTy89w3l1EwIrfTwuEdA
Message-ID: <CAJZwKkicFPW=duFFpqOB6XhFS57M7mxOEe6s0tPxWs3W5B2XTQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf, parisc: Add support for BPF_SDIV and
 BPF_SMOD in the parisc64 JIT
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 17, 2026 at 19:16 UTC, sashiko-bot@kernel.org wrote:
> [High] The patch implements BPF_SDIV and BPF_SMOD for the 64-bit
> PA-RISC JIT but omits the 32-bit JIT, causing signed divisions to be
> silently miscompiled as unsigned.

This is a two-patch series; patch 2/2 ("bpf, parisc: Add support for
BPF_SDIV and BPF_SMOD in the parisc32 JIT") adds the parisc32 support,
threading is_signed = (insn->off == 1) through emit_alu_r32()/
emit_alu_r64() and using $$divI/$$remI and hppa_sdiv64()/
hppa_sdiv64_rem() on the signed path. Patch 1/2 provides the shared
helpers patch 2/2 uses. With both applied, the parisc32 signed div/mod
tests pass.

Nicholas
