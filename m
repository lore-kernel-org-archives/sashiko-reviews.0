Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576343C8197
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 20:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785876609; cv=none; b=tfSTxYtgj9A3V4lS/Uk253yD7lMcyfQUOJAvBJ8bZR0TjKCc+/0+Z+M9C2GGZLxBn8pj+xGy52K1NO+jyNw3d4gUD1NbGwpoe6sFIPKwGHbWHSAORoic5aoCiadXA5CdQKrgBtLGXldAK0DhKfkb2/Ve+SpL/6zk/9CsoDEhz1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785876609; c=relaxed/simple;
	bh=JmWiVmd4Nd6WayL2l0rOeGzkd6TqNX1vRIObxONb8yE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K1Fa0P+wxI7Hw2TBJId4mN1WWxG2BnpSIqV2FUSVinSClsmFTb51rlcKZTz4cEjMCBVePppg2ywP0M+PA2ag0laxqlFzGDkCkEx09x//6cgtkrtw4Xyn290V7uJKihTVe1PH28FTdyyAf8kSyaHyA6E6egGl5M+1y/Wq8GMdrX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a8Ng7uee; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a8Ng7uee"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so182894241.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 13:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785876604; x=1786481404; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JmWiVmd4Nd6WayL2l0rOeGzkd6TqNX1vRIObxONb8yE=;
        b=a8Ng7ueeW2MseH5ZVNi8o5rS58KMbtcIHwuWaPzP7E+4/QcERpo0I+AvTYod6F8oQk
         AtcBaiAWKzGeiz1WTj+2S50YmbsQ2UWihNMgGb7+SyouwPf8Qvziw2/CyA04Huv/+uH4
         FOMTqY2N3+D+lESHt6kfalxffxbL0eoPbsb44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785876604; x=1786481404;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JmWiVmd4Nd6WayL2l0rOeGzkd6TqNX1vRIObxONb8yE=;
        b=f7TMGByD/9dg0zHgYtW/FCfFWsqnGaJFMt2EUQqbBFfk84QzgLcD0Hr875i/IDnR7C
         5Mu3zkSsLnk69+MUaPqZeMKz5VoSPp83FtHjYha9VRPj6pZl0Gzj4m1X1xx5YOZMQWUn
         kVQngCrXQycVeWcjEkbIfEGH1vDevggSaLE+QGcceHiRtudwP+DIzj/q8PQqvVnXW4QR
         17k5jABHQy9QzQp994uM9UOYScF83i/rIYIDDbToTT4A73YJxOOGNzmZbf7wk9rBdb3P
         WFWIUWbiy/ppGV4K0ER8KnphoCp5bbvj1EYUqcXbtPYY8du8yKqVo/hzt/AbC9c1gNPv
         Uxag==
X-Gm-Message-State: AOJu0Yxua5ESFVbP4XrSJn0K86e7uMkjf3+1pKsHuUlot2zQwANvkgzn
	nNuQFG+TYRsWCdi2u7Eepba9hgLhkGqecOXsLKzK73paYJo+S2qQu+ixhVrfpDU7jTqm5wsTL3i
	ZKJ4=
X-Gm-Gg: AR+sD115hnrCg17/fVR+8eCJj/NKf09y7+7zVuyLj4xlZcAP5rH26CYZeWOe0jTpWvY
	8to/WUd77hv0gQ0IWsi3INJ49CAvK0zAaTk38DL4hj4+pkMZP2jtVhS3qDUyG3IUa/j4O9laJxt
	BeRqZi8JtJouxxCl3CPkYleYky99lKS7UhfE2HKOV+YRWlIOQ6kKyoA+4QuOEVdUa4dJaYtKFnA
	DHLQzCPfZfP1zZfYBfQtA3tPb9//Wrl6YU2I/6u7JqJk6mBRj4uEz/glcjRcAEvBPQOJUePP81s
	mfwQtEcboTUJJ1C1UobNHgJq1daCFb22BHSCwujvejgo0OBgHevzNMe5qQsO9zvmUZzB/yPBPsf
	6MN7gcpsFO/P0ta8p6wj5y1PWls3IpHPOv2Xjx+QlFe3rLOLa6vJO84Th4q/Plo4f55i0dPNw1V
	2uFEEPIzWlFMtQ1PK4Jtxghkmzlw3mqhsfxD5R1NWNgNMEtQfqhh+T4LEKd1wSPbjv1jT7W6tc0
	fP+9uJMwEzdP9Lhh4GORcsEPbg=
X-Received: by 2002:a05:6102:3706:b0:745:1c72:cf7f with SMTP id ada2fe7eead31-760e78e60b2mr431584137.5.1785876604259;
        Tue, 04 Aug 2026 13:50:04 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9782c916788sm649175241.11.2026.08.04.13.50.03
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 13:50:03 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so182880241.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 13:50:03 -0700 (PDT)
X-Received: by 2002:a05:6102:5345:b0:745:31e9:f3d2 with SMTP id
 ada2fe7eead31-760e924341emr549143137.10.1785876601279; Tue, 04 Aug 2026
 13:50:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804133801.1.I8b3ff71c528133e7d6f81fe926fa39e6451d63fd@changeid>
 <20260804204450.03CC61F000E9@smtp.kernel.org>
In-Reply-To: <20260804204450.03CC61F000E9@smtp.kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 4 Aug 2026 13:49:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XFAM=y2p-AornMprUSN2dRHrrhUinBXy6K6-GAgo+hjQ@mail.gmail.com>
X-Gm-Features: AUfX_myMue-9Vsq0yOZmJgKRFBa-_y0bCsp87pVyUo1YRYj-fxTpnsKL0Kr5PaA
Message-ID: <CAD=FV=XFAM=y2p-AornMprUSN2dRHrrhUinBXy6K6-GAgo+hjQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mailbox: Delete old 'mailbox.txt' bindings file
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	Sudeep Holla <sudeep.holla@kernel.org>, Lee Jones <lee@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 4, 2026 at 1:44=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Deleting `mailbox.txt` without updating references to it in other=
 binding files leaves dangling, broken documentation references.
> --
>
> --- Patch [1]: [PATCH] dt-bindings: mailbox: Delete old 'mailbox.txt' bin=
dings file ---
> commit 1b70b3f250d6bcf306aca223e0e91c9fb8a20cc2
> Author: Douglas Anderson <dianders@chromium.org>
>
> dt-bindings: mailbox: Delete old 'mailbox.txt' bindings file
>
> This commit deletes the old mailbox.txt device-tree bindings file. The
> documentation contained in the file has been moved to the dt-schema
> repository.
>
> Link: https://lore.kernel.org/r/20260722140214.GA548057-robh@kernel.org [=
1]
> Link: https://lore.kernel.org/r/dc7a2041-50a4-482e-9930-566bb3fd1e72@kern=
el.org [2]
> Link: https://lore.kernel.org/r/CAL_JsqKVjQ2m-dzMUENQry-f_YE9QrYSOKoH9CPj=
1gjj8XkPRA@mail.gmail.com [3]
> Link: https://github.com/devicetree-org/dt-schema/pull/202 [4]
>
> > diff --git a/Documentation/devicetree/bindings/mailbox/mailbox.txt b/Do=
cumentation/devicetree/bindings/mailbox/mailbox.txt
> > deleted file mode 100644
> > index af8ecee2ac687..0000000000000
> > --- a/Documentation/devicetree/bindings/mailbox/mailbox.txt
> > +++ /dev/null
> > @@ -1,60 +0,0 @@
> > -* Generic Mailbox Controller and client driver bindings
>
> [Severity: Low]
> Does deleting this file leave dangling documentation links in other bindi=
ngs
> that still reference it?
>
> For example, there are explicit references to mailbox.txt in:
> - Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
> - Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml
> - Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
> - Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
> - Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.ya=
ml
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804133801.1.=
I8b3ff71c528133e7d6f81fe926fa39e6451d63fd@changeid?part=3D1

Sashiko makes a good point. I'm happy to send a v2 of this patch
fixing this, but I'll wait to see if there are any other comments
first. If I don't hear anything in a week or so, I'll send a v2
anyway.

-Doug
