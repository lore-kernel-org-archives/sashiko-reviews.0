Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795616254;
	b=nG8jysCPPoNz+YLQVcsVwFyx9XEoO69gTf1GGyPQoT0GoBGvulT2KcWEGYCTdhvfBbV7
	 jI3ztaPV4Xjwa14AnnPxuh//FbiG/zGlH+96v5JqjXQ+IrK4jH/duBdn7eUVeU8KYNvVt
	 A1wuEBN8m8E/H5YXGbAdElf1LY/AN4pg8RxrpaAqqGHGYU07JBn+Cfod0GpA+0qv4omyg
	 gp+48vMa13R2GGPUO8fZG/wil/4StgisMI/uuqIxGqrJDq42y25OCPBguVJzY/nyfno4k
	 1DDnlHFboJIrmeOyP9K8e47qcwdLX3MVdUiA1RG3Gt5NWM9IFIFaeVvrC4SF0IMst8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=vBumzuwbB1cqhsQzbzZed9p920xHeV1nGuMIbxgs7y8=;
	b=wmHSlHNg5Nu//+34qjB0SSveY7h0YVewXZDqnmcuUGvCXrEq3d+8ofWJQDZ7TUKqVv0C
	 IRLR+enf8bwPmFe0to06gtx7CknYA4ya5ALPfW+CkGRceZtY6GrqYZRU2FYNJxFK4p6NN
	 jYEqIimJkNYyophY1YGaJtQkHrX0PP442uYOO1p8cn5+WUkM1Fscf01w0zLhLWWFIHuH8
	 nVHwVZd0hMYViQ+P9WX+eClHUvyhjQKtpn9BCd2NWMXnt4M7PFSQkVCSACIoMEDMAftbR
	 s6OfEi29OEzGquovJYbCvRRSJ54KIan+LRaw6e5znRDoaXxqZk0ITpLSsmywgc0tOpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SAr4zx1O;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C32E606A333
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 14:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C32E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SAr4zx1O
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so75240995e9.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 06:17:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795616252; cv=none;
        d=google.com; s=arc-20260327;
        b=fCj8ebi3yT5vOW2RkplhKYmaIe9EHU0/zTMFvZkkoVF1NwPWMYmvZ5Wbphqpw0jz/0
         aSDtL9n68lQHc/urehAx6CA/roDG9Ps0sD1ixNGdycjLYwsat3iDkwuRvRfvE49UWqMu
         9IOa/O3Nlejk1xTa/PgChzIKJ+tprgxhtAIH79iM03810Ch5FueSkWkKy13Vu/awN1Gc
         3lelVjcXkU4HTFKkK5vGwLfwY20ixSoK6ZOKkKQ+Tvp6PZ2yvtfsbz3Rmah71f+PbAr/
         X27mM/tuL7la5JZjJLO0XLCNQdvAsgBxCsMy2hcJ7oZinEDTEMJkmlrP4ltalmrp3AMs
         ZfWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vBumzuwbB1cqhsQzbzZed9p920xHeV1nGuMIbxgs7y8=;
        fh=/O09ik/iraSYs4k63bdb2Ne7wESQNzsfaMQ8DncXGf4=;
        b=DgWPaX4hbgFAvlu4AaCCKuUWOdVcxDDixfpvGuF8Si+1+jWwNvQ3epe19N2e8tTli4
         19lzCugYQBnfMeRlxrHXRr4U39+q4fffyrPOFI3adwzn0/dwPC1uVPXmWJjYS7TnAP3d
         YEAdZ0HcnXhMeUhCPLb/E+HKhPFaUWUYZT/IEYaU/8EcC1YyC31gkCdXe2pkH7Yio4Na
         k3BzaXZFsI3XV21gL4EkjQ0ynUxih2sFU+0+mv9Qq4ZKbI1BNvbZE/TdPGECQWsqzK1f
         dPf4MY6RfYhSnyWxGLmSgLUNdAeYDOEIw/VgBqtBIKEzZMBxL5HokYYADq3AW6A9ktUx
         STPw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795616252; x=1796221052; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vBumzuwbB1cqhsQzbzZed9p920xHeV1nGuMIbxgs7y8=;
        b=SAr4zx1OYPhXcnurm3bU7jQjDMOXzox7vSdALbLAat4pCiTfq55WXvdLCEUIzv8sUw
         KySNjoK9APub3xZFJTiRnu8+140rYZiFZ6ESN548qG9dYjHBetkpLiwvLRYANRcTMNSl
         3SdfxIu8T0YXWP2SUJWpXCM+ymwfxZ5msRJf+IfO6imaptkRTyW1t5gbdPR3pCnFzXVj
         OCLLqNbhO0Ky2aXsEpbaKjswP8cwxtlbPmrvhTRIB0aSe2xaNyTyKCs+vEO6T1N1iAj0
         TctnL5boCEsw0g8VoDRsCV/stfG6t2KdUoduxBrBsMaWsJrh1PY2n2Mw8QreIyorDM+k
         Y3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616252; x=1796221052;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vBumzuwbB1cqhsQzbzZed9p920xHeV1nGuMIbxgs7y8=;
        b=HHy8IfSZyjOh+9nASdsvFCLpaL3UVqkeFxTSTn0WTt0wTsgkZ+vH7gZxG5+aD/K+PO
         V/V1eWCf0t40Fq2L4KyZ1mmpotmijxbFuGYT6G+zqbubnCMEjd7sOQ2rfFXRGiotMoTW
         +xr1m8G7SyvhI/iBcHJCFtOdNIqUXcs7KHcM+1x/NxKrdodxRO3ODzZJXcJ417X+y4zf
         RbIJBDt660EkrYW6b3Ucab1UMFGiW1Tkq2cb/w/z6N5zcrYbqOl9SVQzgtQNakHiLChO
         X939RL4WFEqSuHGxGnOyvPwz15nMDFxU94brp+e4toZ2xB4JN8TQFWxy8efU8SpJB8Pt
         jZiw==
X-Gm-Message-State: APuU4Z+gcZoQQ1lQAZDHs4VRZpeVFn0gkpGiwIi9IasBQXw52kuJB0XJ
	N+YvVcG/4ilGirsDhvIvpYhi2UPZkz2k1tXy0Cqk/V15wL7ea8+Y36WZKGBpKJw58v+dXHPEgwX
	7eh5bubyXtQQFeYXej470rZ+Y6H4kdjm+8JJrnL064w==
X-Gm-Gg: AZFdTZcuuWLzEhRySP5jIsWzDbBsBCiQKyOLKWIpJ6KW4iUtmKnEiEHzMEQMgyVi/rD
	bHJUaw6r5Sa1lTLR5lTrLU+qE6HPo8aaxwe9X1zLgz1Pcoxkw0xx9Rkz1gOHgoSA7XaC26z2VcW
	a1+WLyHaGU2cYT2IRrUun0QaACTpXsaC+SWgdkl/O6vjXlGcs+97M0VENlaKNp2sLxjfM45ALZ6
	/jXuj4Y5/kcmPnBeBIE619S2kGr8goo1Ab8Ba5kfLtiXjh1Qg5No90zlYSUNglkn5dZiTn7hIpf
	tlbD3/AqXldnhorvh/ggJIvI5cITQMOGvK1G+87YPl9GgZrAyD7/6T5eh9MarT2W0cJC1uJZp2D
	l9NjUnkCdoY3PAjWbBRytDlABnly+nYc6ljeH9d4dyFQkBT2Zr3UpV1Odv0UazCl08VJvgBSgiq
	X5BVJzfISDl/8b66Lj/VhBrFD4DJtQDS/FbtKXwO7YZBnNtAdWP/klibkE+9t/+Ns2POZldh+aV
	Dpz18RNXGK9LRVSacOaZ1c3ZzCu+hh1OOVBAJoYfg==
X-Received: by 2002:a05:600c:37c6:b0:4a1:88df:8a2a with SMTP id
 5b1f17b1804b1-4bb88812a84mr362088125e9.13.1795616251699; Wed, 25 Nov 2026
 06:17:31 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261125121448.180847-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261125121448.180847-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <sashiko-outbox-233356@kernel.org>
In-Reply-To: <sashiko-outbox-233356@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 25 Nov 2026 14:17:05 +0000
X-Gm-Features: Aa3M54r8YU1j3ibEMvD5V77dNghGpt-QUE7O5ouYpNUXFMRABVP1zEURrzSkPig
Message-ID: <CA+V-a8vcfrTckn+8e-OW2E6L3+FUgJ222Yz0q_S2rYK-XbF40Q@mail.gmail.com>
Subject: Re: [PATCH 2/6] arm64: dts: renesas: r9a08g046: Drop GBETH filter properties
To: sashiko-reviews@lists.linux.dev
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 12:21=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] arm64: dts: renesas: r9a08g046: commit message cites dwmac-5.20
>   instead of 5.30a
> --
>
> commit 820f5e22ff857b9ee742d15a64ef6dac9b4c7ea8
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> arm64: dts: renesas: r9a08g046: Drop GBETH filter properties
>
> This commit drops the snps,multicast-filter-bins and
> snps,perfect-filter-entries properties from the eth0 and eth1 GBETH
> nodes in r9a08g046.dtsi.
>
> >     Both 'snps,perfect-filter-entries' and 'snps,multicast-filter-bins'=
 are
> >     discoverable from the MAC hardware feature registers. The stmmac dr=
iver
> >     does not parse these properties for "snps,dwmac-5.20", and derives =
the
> >     number of perfect filter entries and hash table bins from the hardw=
are
> >     feature registers instead.
>
> [Severity: Low]
> Should the commit message refer to "snps,dwmac-5.30a" instead of
> "snps,dwmac-5.20"?  Both eth0 and eth1 in r9a08g046.dtsi use
> compatible =3D "renesas,r9a08g046-gbeth", "snps,dwmac-5.30a".
>
Agreed it should have been snps,dwmac-5.30a, I'll fix the commit
message and send a v2.

Cheers,
Prabhakar

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125121448.18=
0847-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D2
