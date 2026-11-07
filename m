Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794074178;
	b=jbQO5wPDMCbdq0gOFx2mcxuUeAzE0yC9XF/CjX4Q6qLTbtbVfE+6k4yPWG4oyppaxgbp
	 DrWBQWF47twDYIqHQhIADLdPn69+DZSNc4H4nJ2CKlol25wlmUwT52sli/yF5tV7dHaL+
	 zC8EAxgmtxlVIv5eJODblPGJYMfGlftzUKkOMQhB1ff2fIL0/ZDw+CpBBbXmmD4sjdg+R
	 7dhQF3yZgTW0/SUjqfL8rrF4vgn2Ctxm/LmnhmYQ15wbUuiAo5qnKkECFuh6fUVhYVk0b
	 PTDThe1l9iB9IkNTBGADsD5AWSE0tPZ0BDdKt+x6YcsormH59qs0/Gd0remVvjALLVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794074178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=AH9LGqWfLPGgaRsP8Zicyr9XO62jY8A3Vt+hci1ouxw=;
	b=jBvBPPSTNp6E9chjrvYdSdaeeikgInVw1Q4l0NQgcVzlPAYUZ8WyEsDMahSRkr6RIVIk
	 KSEqGnnQabrj6XxV5eVpllTuaoShcqVb9t1OIbkEFzgfi74LHKCUbATpBKJ8Vub8ALyht
	 PZFE2pl6NxeMBVYB2jlBnw7jACrX5LqWlD9ouX/phkum9XKWLgKzDOVt8RHYFDiL4mgyk
	 TPLayb94g4fmgds+abfqsZ7YO3gJkdHN2UcxIZU7Zn6A1LIKX8v2KLs+MGExUfb7Q6u2c
	 Z804OPSHDz0b1bI28sJvWejUfOfdUoc+nqvRdaN6cYIWXPQ/xIieeNzzR8tdjd7WlIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=At1kT0Lw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C2B606A326
	for <sashiko-reviews@lists.linux.dev>; Sat,  7 Nov 2026 17:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85C2B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=At1kT0Lw
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ad47c246f8so190756a91.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 07 Nov 2026 09:56:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794074178; cv=none;
        d=google.com; s=arc-20260327;
        b=Jgrp9Gtqf3H3lMLMTH7jjJjiemU7lTAlsEIIoxa9tuXti6VyjX3Ug57pksJz87BFhq
         MkWXo05zKHJ8f4lYO5dpjjvnk+A52dUFAzVJde4klaayZQGkKaYWizhbOG3W1eSk2FAc
         c1IZX3CxzxQoXuZT1LY9oFfCQK9Ut5D78+sAoOtU36HILK2Hu+vgxR/MO4lwDUBjMRkj
         pStSj4VMMyUHAhxgwC9w36dw/KH8ssy1BQQq8rKR6jY2SSMIVVw1Jk7LeOFVtCi4ELfw
         j/wCcxB7wqAfcVHemU8DtgrNyNnId6AsCuWMdsnwIakhJnFYw9PUpX682BUNiaPuQwg6
         rXPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AH9LGqWfLPGgaRsP8Zicyr9XO62jY8A3Vt+hci1ouxw=;
        fh=mTP6TkWV1IhQRgyhsEpYqIpiXvhDlZKdHAfNRdOTDjk=;
        b=T0rGF7aawHnRfl8RwdBOfffKCkTY4cutpSUdOg0YBjiJPaNxERwqkjyH76W52lT1i/
         s5wOD4DS+MdOOK2C4pcl4S4SkHwQS7CSAYPBwVmDXIQNFO+HuLvaGGGz1NZw6Bg3CB/C
         gqQT1izjU51gaQNKo6ZN3vQBCiBQ/6gpsWsEAmRu6G9IL6J7At02aNpBN2g8e3GlfkJy
         WeM4t20TXPVTbL3wa43b3sl8ix/tK/alBLoMzEs/1kjFXVkL4ZcGIal4FaF4+9Fwft2C
         Rze7GjnVwuyOLE/jjm1JPacSdFbs86XiZIRBP+e5Krr17pOUq2lOF6qVCsiued05cMc9
         +Uow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794074178; x=1794678978; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AH9LGqWfLPGgaRsP8Zicyr9XO62jY8A3Vt+hci1ouxw=;
        b=At1kT0LwI/iBDtSEyVC2AYC64RgdK8nvSVdy8M/P2oz0jyzvKeNZmkOApAUu4pjs51
         xS/I5fdZLoEdjlu69olFvUtwL9KbPm6Uw/uXDzLPKISpF1LfzQH9Xtuluyxv4i+xsdTt
         5whQ7rEaSU+6+8bEvwCDVjTkKCHkaPHG80G90OVU6WG0Dozik5Vv4+d081b3oj/R6k2S
         wu+Hu32Eh5D+L9U1T3df9GZ4ox/Iu8Ta35JvWFP9f147uH4CN7E5pBmecsRT0JCiAy0J
         1yEFV1J/bjFMWZ2oM7bXtTlltgWgACo+hz6RemaMHH8w0ONrCD1pPx0Uab0SLL1XGsTR
         10Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794074178; x=1794678978;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AH9LGqWfLPGgaRsP8Zicyr9XO62jY8A3Vt+hci1ouxw=;
        b=Ayqa7HdbLyqiAC3MOx9VIziQSsb0Sbkcs+emAxNUUQUFbFnREa6cpyBvruJlLEjY4f
         mqsrmDBDt6P6tDtyTF1/mlGyA6ptwSDxAR2/JO2mmS87h/qLsCe9GZnDEt/i0xAW7E2Q
         4aaKRToLFvBy0OXs8513y1pjNzaMTiqyUyFZeszXHyV/9X9XXKp7FDk7z7vNWDnBAL19
         lvoVqi38uaG2atALeN0ok8ppMUpoYbT3lZZJILsPoHr6OX/6YUf9uATZWamcya+KwqIR
         b+44xJi0y7o9X7CL0/o87KIhD2wnaTc+ygxkPgFZCeb5vSq/KhyqTko3Yghx/rkwJ1HM
         Zf0g==
X-Gm-Message-State: APuU4Z/njfJkEZno7qTEjyY0LrXngSLgf/rjTs7donK8fyqfFFxna/uL
	H8JqAqreNzEoSROxyl2hQBBUpdOVNawaLQ2Uf0aJRJzFe0l9NcB8ynexEDawbtVvQ+tK1HHjNi2
	UkGCet6LJ+ugUGLLfdTpxoTqjgODGcqNJtdXM/SvGeA==
X-Gm-Gg: AYBFou0zSdTUgzqZHUegReP7YT9w5V28zLx418dTPsKPOswDVQrUD5Xes9VjGAIhUdJ
	ZG1wSaIXeQmhfyoe1JHySQ3E8MThcXL4MXZWtDa0EiTnk35vXnR+Q0cDFZGwe/S2tZPtvbIWh+q
	gH1iDTunAi5ivY3l9QtwQXoxu+zpqxINzIPxTOuMtSuvmZchQZrLIECCUwQ60KUk87e/mgEhu3X
	WKH44lLHPgZSJrnhJri73Td/RzFO8+S0JAnwZIhMbWaC/lH4LM23KpBQWRqzhjY1bnRm2nQWnRH
	cuNrZ6WLtvzb1mc/sIQAJqOhpLqVxWbuG4RUs/tAhYdhg91KM0O0wf//JfFMOb0m5HhTQaGipvH
	LE4r2qT5dhWi7gcF6si6adEvMy/7wU4rGyi2HHQ==
X-Received: by 2002:a17:90b:4a89:b0:3b0:975b:2256 with SMTP id
 98e67ed59e1d1-3b0db6f8e05mr9097288a91.4.1794074177596; Sat, 07 Nov 2026
 09:56:17 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261107164305.11476-1-lui2012qwq@gmail.com> <sashiko-outbox-203076@kernel.org>
In-Reply-To: <sashiko-outbox-203076@kernel.org>
From: Chengyu Liu <lui2012qwq@gmail.com>
Date: Sun, 8 Nov 2026 01:56:06 +0800
X-Gm-Features: AclHuK9CALZ_fnVs06UuMczhS_NxicTk_7Y07aK9CoCt30E_RB7xhrK7ulJoreQ
Message-ID: <CAE=Q7=6S1mGX9no7r-Cu2x90gqSBB4TPk=OYWe-npUwLabCPmQ@mail.gmail.com>
Subject: Re: [PATCH] md/bitmap: fix missing_pages restore in resize rollback
To: sashiko-reviews@lists.linux.dev
Cc: linux-raid@vger.kernel.org, yukuai@fygo.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 12:53=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> - [Low] md/bitmap: missing Fixes trailer for commit c9d650322829

Thanks, v2 sent with the Fixes tag.
