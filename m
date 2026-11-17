Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794959498;
	b=nG9TU+ncdSw4rXTlqoDfp9oEFRnwxykSDCb6+E9ZLQkTiLW7NPhABtpdOX+fXhNeyC9V
	 hFp2I/udNS6OCjazaUm/0o3EMDeVBmYCR6TvCXfQKEVd5A2QrlZA1PUtlFr52ozMOzhrv
	 QOn20iWvg6UUgNqH8fG+1I4IyUu1wU53HL/LeWRD+7E8iCF1/xlm+j/vr6xJHDds+cRjs
	 08FDYawNhkG6Znee11rFWmu5cwSO61q7RWGWhyjsCyXV4eue1kRjKU2fTjQa0CPlHlpzI
	 voEU57AEN6Zl4a8BiZvvKfYdgF6xJQEMLSVcMIWa4ZiaZwH5GZEh3vEPbn+qTu7RZ3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794959498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=tj4WV4vIcKzSpCk7dHTQCpUn+mLl32o1qUnDLoMnN/M=;
	b=SjxatzAelstwirjx4tOCunZ90NJHLfNqL9gg5XGjpyNc6diId6PTSGZof7YUgzh3j3r5
	 EZe9+YWD43/unQzACb5nU2xhg4kgus5ujFhE4PeiJLpXOj4AujNu5WIugwvHgppxl6EQi
	 XvPfx8gmeOmVii0IYdKho6AvZrgB8NDipI1DPrUS3BWsI6fg++WBGSzZJPHIv6mOajNLK
	 QgaOwfSvr4sjgcd+DNkENHhHAzzKQpVDfpo9vqWE5z71wdGzlPZ3+ezWr8ErGaKxYosSC
	 vlUVcfKIHMZTl4NDVeUrG9IukBfNqy57t0VnHrEi+dybCFKvKZGnbCgkZvrUWU2WKZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CAOH2896;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02555606A88E
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 23:51:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02555606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CAOH2896
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so1093736eec.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 15:51:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794959497; cv=none;
        d=google.com; s=arc-20260327;
        b=iFy2D6YcT1CArGPJQDb3QcOu1AM24+M54iX4mvBU/JTr84GWAb+2Uk9xXKTNmNSMm0
         zO5Z5O5umORItU6PFS3zhpN3BNaLTBDWMi7f7HAmIp2XoYrg/uF0apo/KYAtYjbxsBPL
         w5ch3G51d49WPBZwT1utjSWUkeU3FWiN4p1p0fxXUUxKPte49agEF8PgSKVvQwSbJP/a
         rChDyIgcFCS/PnuZOln4kd11cJboPBXIYNY7Yry9iBBlVGcC+s2xo+0qC+99fUITU2fz
         76g7Y+mVJcQM+b1x81HhAYapuZRgjtdmynjD5FEEIYIp9Q6I3HoM24KHm8Ea28KQDF/R
         JQ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tj4WV4vIcKzSpCk7dHTQCpUn+mLl32o1qUnDLoMnN/M=;
        fh=bN3WHTlzXcVIr2RkgMpk3NXK/DwXOefqRaFpMbeYf7s=;
        b=MWnTdlOWtqG8M8+LwuqIm/JNMxGtzC71jtN8bm8cFR2+i/BhEO5BtL0yNvj/NCEvro
         2AdtHaHwac6AFK0ccA6BpvPoTqrHi0+P4fQKoxdSZbs0b03hPSdXRVYAM896LadvjfUa
         rV6zUqFvvZzOQXS4tmCo9ZhaV5entgB+WilinA0BRJ6o6EUJmE8p4bTYmSb63PQ6iFR8
         I7r5vHgzpSRsQxv5QS07ggQFBVZTX+n1iDzfrzhVmEv4mnGaA8BTh+cTejvd+OnsTHpR
         B2JuUPux7eqaF199QGq8RK9TdZDQU8uGwutbBfwLo6apMhehFJG+i4kfCt2zNSHKvvhO
         4Fnw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794959497; x=1795564297; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tj4WV4vIcKzSpCk7dHTQCpUn+mLl32o1qUnDLoMnN/M=;
        b=CAOH2896PC372Hq0HT5b1ZlzZpoJ/JK98UhwpXqsj+DTodl71HhxsYnVZi15tb0r4Z
         sw797JgyRrulEGi+ZrZcVhOxnr3X7t+LX+FlalUDkwJPMTxduINnMBADVT7YNqxtLWdA
         5T6vSD26NIcg+wqmDDwUtz5UxFy1yv+HWdNkskqlzsWVacjJH2q7KUnYD6qjiHRinYtU
         E00PDx4lH33532yS/NY33Fd43Vnx6KC54clvwzrKADohODYRA08IcJcOzAtFUXClN+zz
         3p3/O9eYt4qPZa678WmMQqG7/QdKqEq1gM4gld1A3Y6AwFarq+IZa7HT5yaYbf/35Fo8
         UFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794959497; x=1795564297;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tj4WV4vIcKzSpCk7dHTQCpUn+mLl32o1qUnDLoMnN/M=;
        b=12QKb8NQ/lOa9Y8hN1nmsDrsmBJxSCWpNjhJpHhGxsjJGFKc9aber9NeSb2uWapmkS
         /tEXCXJ7XHoRYkn+QvcXSgWMjTWOjigxkM5MxoqS90RHHJ6579FGs+0JBZSLOiV8AeLF
         lqEc5iGf08z2Dv/er5uuWbQgkH7hd5a+HRoqldCDB45Vj5J0ehOHlxrGq+GPH4CFKjoq
         PW+XKeasY6OtwNQ/MRM8u5dEBdSMzuKpJM4MWjLLh8hmyYpD4s4e0G8OBBqj+UwD53d9
         xnUi0M3gWgW1ioZVycrAxh4di6yuP7umUxuksbBvj/brU1YDPL284n65vtMdQL4UkmoF
         WISA==
X-Gm-Message-State: APuU4Z8H0EkO2sKqKzlC74/IBfs/XNpasMB/WyTn2yv/VBJR3rpA56Cq
	xYo03/q0ugS3p1JBtiBg67nzLXLVqQOb7bF/3ajyyZ5j7jrkkvTmQa6sCOQO972Qx8kzJIm7jXb
	BeWi8JgX4/LfgVlbzjc1IYUsVKOzhHu3UggXP
X-Gm-Gg: AZFdTZfSIVhFfrqtWDlHZZsRtWTD+bvM8cy8RhbKuvuSlcZTi04KjteZ8gzkN0TiZWE
	yJX7zgiQ5/Olyx+9exiSzpoZsH3vc6HKlJF04K8IrP+w3eFqI6np4u3OKwkq0CXWtSf2O+kVf/0
	TWrI0GIryDE2hKxm+zbhcBzI5lSKiLTmzvi26AersLGjftZc7xtM4GqptVtc0x79IevAOlEcRaA
	CwRPJF+1eUaVvibOLs8o40fqfuSbEBAoWhELB3Q0TAhwKjc1xdlxqDzh7+Yzhj9DyDX+js31F+y
	/PGUNjHgy3Wt8CjmY1WC3fO96K7sOeltXAPxSd1ucYk3Xo/GI8KCQGdYErw+Lp5cxMkzGZ0Af0M
	+5BCTgRShJWWkgyPj63MYMz+wH12nzH52zvMpzmG15tO1sYwEllW4gCEKMA2C
X-Received: by 2002:a05:693c:8946:10b0:370:1652:5ff4 with SMTP id
 5a478bee46e88-3827f5ad382mr930583eec.6.1794959497041; Tue, 17 Nov 2026
 15:51:37 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261117205902.1293962-1-henryzhang62@gmail.com> <sashiko-outbox-219679@kernel.org>
In-Reply-To: <sashiko-outbox-219679@kernel.org>
From: Henry Zhang <henryzhang62@gmail.com>
Date: Tue, 17 Nov 2026 15:51:25 -0800
X-Gm-Features: Aa3M54qqTmOUkotRAt37uoUQQWDtU-BVQrOf2bvJF2uRaw79Y05rSNpAac70J38
Message-ID: <CANTW0yqbWZjvzf9pKETu5x5vAC6FtMMBLpRi11yGXg=w=so54A@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: dsi: Allocate the encoder per DRM device
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 1:14=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> [Severity: Critical]
> This problem wasn't introduced by this patch, but does
> vc4_dsi_init_phy_clocks() just above this hunk leave a dangling OF clock
> provider behind [1] when vc4_dsi_bind() later fails or the component
> is unbound?
Thanks. This is pre-existing and independent of this patch; I sent a
  separate fix:

    [PATCH] drm/vc4: dsi: Register the PHY clock provider with devm
    https://lore.kernel.org/all/20261117234107.1298575-1-henryzhang62@gmail=
.com/

  It confirms the stale provider after unbind and after a failed bind at
  runtime; the use-after-free lookup itself was not reproduced on my
  Pi 4, since no clock lookup on the DSI node happened in the tests.
