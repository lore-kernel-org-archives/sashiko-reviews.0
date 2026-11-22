Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795339694;
	b=aMAJ5eHuwULor4qjJWt7YQxRzsCTDEQWc9RHNLu5JHqONlBUqi5rygVGOOmMlnD5h714
	 csTsQ2GpHO/ytjSsCK25igDgcny8uXejykMlb1g9VuMzjdwTPebspbX4Man0QiJ++1dQ9
	 qhIbfzHVtSy38uTgKqnftHyLvdJ7DLUKgGZR2YLnLpmPYCCIAXVGwQiF/63svQPaVKPr0
	 lUnyWyI4MiZCwdlf4oFnYYIUdBzTp/h318Zl/dydYoCnvQ/fR5oCn2OaTijqbF+BTypEL
	 OH9kO6i7KnhnO27TBlz43UbsHTrjqNo+75wd0sSNhiEQk3SCAr55MrPaqVD+6WILyBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795339694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type;
	bh=+XU/L3s3AR1zRZpGx05jem8OuHu+Aq/54xxilnMM65s=;
	b=Yaqz/hGO6aDjBdVhNsuQ0lOWCd9AEl4N15IcLyriG6/InctO9T50avbK7AtfnJgK61zN
	 Qrus+0qNEYQ02y5yL2s91oOJDEJdr68tJrSOkdF3kyob+qbxadOAvhVWuSBhfkXFlUU9e
	 PDyZQfeR+N5C9gmSDs3qnDQNVpm8BV6Ft6Bm/OF0UjuLfXP4oPAod+c5X7aOOkFukWEUE
	 NgBm2BC/MiPDYvHrg2WCgUd2QnZ3rAufMIYpW63fngZxBXg/mWnwI0OMmhWtWR/rgH758
	 jUYo0U+qUdOj7BafckmoUMDO4JMk0OaBIrUkXthlXqN+Mltujp9x7noBfOtwpb5nDWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aUlWhNfY;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A35C606A320
	for <sashiko-reviews@lists.linux.dev>; Sun, 22 Nov 2026 09:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A35C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aUlWhNfY
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1176570f8f.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 22 Nov 2026 01:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795339693; x=1795944493; darn=lists.linux.dev;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+XU/L3s3AR1zRZpGx05jem8OuHu+Aq/54xxilnMM65s=;
        b=aUlWhNfYGVmkxRPWTEKaqfoeTYAMTQtlBC6DYKsG8YHxnlNh1oUg/9L6mNWaE/RHyo
         qWw31neNk3o/kGxA9HRGtC2fT9BQEjCKhCMtOdjlc2a03Qrj1bqoivI7tlaATg5KtzJ1
         4IK172lY/MNrbgGs1mxK+oFDwZ9NqgnEGwq3ZCGk7FAgjOoVNN/vLEneOEzG5AyyKNFE
         feqNHpv/o9o1Gph3mqYUi7YhV+MgvgRy4u/J9BKnBqNWBD3lhoOMhUSfOwK0aMR33onB
         QH572+K8gN90Urw6x151N2RjmyIxRdZCI3Q8o+t3URRGjARK/PzoyypqvyxzObDpAMKN
         32ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795339693; x=1795944493;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+XU/L3s3AR1zRZpGx05jem8OuHu+Aq/54xxilnMM65s=;
        b=BYUk9l0izVektjF1oPqbYec4eyHmgK6RILIuc486U87W1jJK1uStNkJ4xwD2AecYR7
         LXGEj/H3YhNdKa/tBKMKov29RpyLjA4E5gemKhChtdJjQ9KfG7mzW3jj3eHe/qAoj52C
         VJkHyUIFubeqFLyQyrPEfhaHJdKH8gKjb/TTPikXRdXqN9Fi8Pv7n4RPryYSH8sEnLEF
         UYZs5V/WDMdKaZ/hJjLnC7CyQiyPIRT4HDKT9dw2j/5QjZEf/C7e2NMit70enUpXw6yr
         APskG6MpiGgGwU6JOkb+vp7cCHsIGaD4fCOyFE5xo89+WBxh+TO7luDGFcMd/h8hVAV0
         Jhsg==
X-Gm-Message-State: APuU4Z9TTgLEge+eeKxtRPyWCtSJqHjbXTyndHXN18RunJmFyxFzP6QT
	Ys//UO/dmFmq0flZFk8c+/tH+cWcNv4c20X75W7JdJAZJBGGFGqnqEKFeArJripSb+ZJgw==
X-Gm-Gg: AZFdTZeYQx3wU34nmYvj9VdFPWh0hCdcEI7B3mxZuYs1dCqmiIGeAeZji8zEMOVGj36
	BgfUrzlsTDsBEzk0LZM5q/fIvqkLrbVd0briG8ABOp3ImyyuX1hPoxo5BPQy7j7FuVyyXRzLTIm
	zpwcrvJHJ/j5q0wTbTh/nqKq+nTgno7zaBsGjwqJIaOgljhfZhCC4lQR1UIAJ2c/Xc4oCrmNaZq
	y3VAIbg8Mlj6tqa0y7K/ULHp764xb73Z3P1iucK94DE2NpnR+LJUgqGNhTiRuJVsEw5dvtQQiMH
	YvJkdmQ6hU0oyBdrSrORfjuk2hZgVB0L1J54D81TMrg4+RZUWHqz0vObOnmEvHYBbyQ8cQrBVzV
	mz8e3DxyEe//uYsmLbGfeMuEjr/RVvYIcYUiTKk+xCf9osOZp98txcKPIgc7PlP+snOPVUZ69YD
	KehnakbkrG3u6G388dxgxgkp31n/9WHbVn3Cm7rQmqOeubp0NurV/vguKEg+jQPfijVGdcZZGMj
	3BdYo4Froeb7mJsOjfMEaKr7ewvGG5FujQFzT7sv2UjTnps0AiUwgIFeYW/DcmGqbWJN19gIU80
	4ebK5vCxvG5puSKbq/TSvIUyjwIre5U99Icq5QHT6g==
X-Received: by 2002:a05:6000:299c:20b0:4aa:2bf2:4d98 with SMTP id ffacd0b85a97d-4abb0f3b4b0mr12062401f8f.29.1795339692451;
        Sun, 22 Nov 2026 01:28:12 -0800 (PST)
Received: from strix.localnet ([197.250.160.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm12250751f8f.17.2026.11.22.01.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:28:11 -0800 (PST)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev,
 linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org,
 vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com,
 lee@kernel.org
Subject: Re: [PATCH 3/6] pmdomain: zte: Add a zx297520v3 power domain driver
Date: Sun, 22 Nov 2026 12:27:50 +0300
Message-ID: <pmvkAYeQQxqf6KX1o0NWJw@gmail.com>
In-Reply-To: <sashiko-outbox-225964@kernel.org>
References:
 <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
 <20261120-zx29usb-v1-3-b0433258e51b@gmail.com>
 <sashiko-outbox-225964@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart7pWE9LkGQbyJZPD4mlTCyg";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart7pWE9LkGQbyJZPD4mlTCyg
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 3/6] pmdomain: zte: Add a zx297520v3 power domain driver
Date: Sun, 22 Nov 2026 12:27:50 +0300
Message-ID: <pmvkAYeQQxqf6KX1o0NWJw@gmail.com>
In-Reply-To: <sashiko-outbox-225964@kernel.org>
MIME-Version: 1.0

Am Freitag, 20. November 2026, 22:51:31 Ostafrikanische Zeit schrieb sashiko-
bot@kernel.org:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] pmdomain: zte: child-to-parent device link deadlock in
>   zx29_pd_probe()

This looks correct - the particular line shouldn't be there, it was a leftover 
from earlier attempts to handle device unbind.

> - [High] pmdomain: zte: wrong supplier device in zx29_pd_attach_dev()
>   device link

This one is likely correct, but I'll have to do more reading to be sure


--nextPart7pWE9LkGQbyJZPD4mlTCyg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmsCtZYbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiWwUP/1zrUTig3p1zQi1yN49m
lZsHM1mGoC+rZz8b6Gofd32dOfizYgpEF7nTr/TVadx3oSzKlKF5ayXHR/Q8Bgfo
ke9bKibuDSpORGTL5M5S4hxiwi9xIJ9Ut6alnVApxneNS1AkYMNFW/mDbSQGaY9n
RdRD6/yKt4miuWmJQdWJLCPaiwcM6e8AbUjCavhkMWEL8z1yxQaUGDNJKIdSrv74
OubQcJfVPr4v6UN7JfUvg/aBCyVH4L/hYNSBaasfH5Gu+BjgB0S6j/i1FY8TRhHe
/+LKiKGph3Bqq5Mh9Ho197e7vfKbK4R4agnxrJV5Iad52JhPtWYhiKUEdeRvduxB
fngHWLMNa2jDLI6iie9bWLAZGAP1Hi5ZeBQrkl2BhXN+BulUPfdNWH8nNzJduDMI
a5NNnM85VdY+jnIMl/D920QGXAii613m+nJg8R5jGg6LrGNt4lV+pcJO3tS7BhOu
vL7UsI2tna7TUMj7bwnVdzmbLMipw8prPWpRTNUNBkP0KaSl5CnKfce7OEYFfgvY
tLLl/eLGF+sOQ7Mx+ZQE6KE50wx23vPSrpjXfERtrFGwm5PyI9OO1fxrctm5cwdd
j7kTk7HZcAiZQUsC+qN436NqIkBHCNR9CCm5VLlOVCRxq9yqYNH0+00P5+jKGjmb
OkG3sJu7139jhrSQYgGPFpFC
=7yFm
-----END PGP SIGNATURE-----

--nextPart7pWE9LkGQbyJZPD4mlTCyg--



