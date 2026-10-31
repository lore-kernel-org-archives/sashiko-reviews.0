Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793468356;
	b=d+kL76q/8ob7ix5lPPimMWRHPPhYEt0xnQeF3v9oo74jmdfef5y+tHhTV8yJibQiQ1Rt
	 hDIdu4o/6Zo9DemZi73u/xGNqQQDES+tKrJy20lUYdCoTGzzrv+T4RUvCJTXaDprBMyOE
	 8ZbScCJjy9PoIB9xsYfP2yoHzYJMYz4RL+91D3l9xejIotnz3TzHO75ugwTFL4Peen5ui
	 r0kMv4T4R3/lld0ATUr9ysdjopVMf6cUtJ3SEwlcF94BZj+FNEZYaOFkvh9nk63uLsYAb
	 2T73BWzYPPnOg1HA3U+DR9/dzpllPDjIgOOBZprLj/tQn72U4UK+Qir5eIwzZqsbGYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793468356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Date:Message-ID:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=5RS4/TCOhSiJb1fSn9tcNQ8qqueFM9qglyQ2e/KfPJY=;
	b=VmNfEJ2SimISsVH/eE19Ur20gZiZCyvNMYVWQY8Wk96y0+wS/U0qyPKAdgGRMwoxvhCd
	 pii3t8WOfyBdCfpoqePeg8ptNyBKqs8dYia36itHpCA1B9L+Vf0HJsKAxgWVZTHpAsuSs
	 BWQ3nVDO48/vVo/ss+6tNNMeOUycoywb/7O+7PgNcIsFx/7Vavo85r/HqQ7fljrJ0Rarj
	 XpSLbGFTFfbEQ07FMvKbeQwZm8xNepZH4Ycm0eCbFvLN6UZ3QKfMYQtPBFVHtMDdjql8p
	 M0v5KzjL3zKZc8IDBZ+kp3yAU/QFYbfm+E18GnzhvVkEJ277h80pvWy6erbzIeGt09A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z6fcIhc1;
	arc=none smtp.remote-ip=74.125.229.136
Received: from mail-dl2-f8.google.com (mail-dl2-f8.google.com [74.125.229.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064A6606A31C
	for <sashiko-reviews@lists.linux.dev>; Sat, 31 Oct 2026 17:39:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 064A6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z6fcIhc1
Received: by mail-dl2-f8.google.com with SMTP id a92af1059eb24-15901d262aeso17378c88.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 31 Oct 2026 10:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793468355; x=1794073155; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:message-id:date:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5RS4/TCOhSiJb1fSn9tcNQ8qqueFM9qglyQ2e/KfPJY=;
        b=z6fcIhc1iAcyDsV7uPuN5EDT00DWiCSLq+IPG6I4+dFufTIyoDHRBoRrVi2Z6h0Eb6
         um06QovGoX6clOJSKkptqPhvTzApz5/Ok+t6bA2uYEYR8rxZJkUsh01ll9qiXOLe5ckE
         aBRwEizql8F6srNXk/PAHlqW4xOWjSfMFgEaWeIEfBZJjx90/RV/G37MSwg3ihJ5sqMn
         Zd+LYjWsfHFtKzmzPu5PLCjWb5tAvi4wJd00hidks3VmsZaGEaSsVyivJxL++47r6x68
         GxWjuEN6nxK4DlxbnK35LtG4l/JpEdq2f91FeumwVs0UtPjBTjnFj4Ir+IMWAYrPAyKX
         d8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793468355; x=1794073155;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:message-id:date:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5RS4/TCOhSiJb1fSn9tcNQ8qqueFM9qglyQ2e/KfPJY=;
        b=WrGleecdvfjkqUFUvCBOJups1rOKhLcKxZoDuV+hJCws3iteUEmZn6vIa6hT1QGjJm
         /pRD7AteKNusPeu3N/7TEQltGQXO/Wxr3/DVFvctI5A29Eo6dpZKxUHEFfAeqIRkd84g
         FJ07/r/m+wcbAnERotbkezDQ//Zzdl/YZIj+jy4n8nm8BeiPBftstFCNShjn6GZqjpQT
         ideSi0ypfXI/fj7FeO9eV2Ck0EY7JAHY+pe4LrtnSV6EA6SUwcpVCLlQzlGH6DRJ1xpj
         GMNXJUSicIe4G/Y66rcbDJ71bEZx9psrsY2b7hK/9h9R7nW5mazdStjUbfiXVUHtNGs4
         V4eA==
X-Forwarded-Encrypted: i=1; AKwUvBxStCyWvrUd6ZQ43M+NUMofTBJL8+2tKScwqupqcxJXGxfJ7k3HA90EcPvKdWhQin3xFBtS5+aKWyRKCNVDO7Q=@lists.linux.dev
X-Gm-Message-State: AFq9FYJD2iaknTQc277PxVrySBlfL7rmdYNOJYUKXnkO7lPp7u4xIJtR
	Dgk43lAwvKWrIq43pBV8OMNU4rGt4BEDHL4EyRSffRgjK+A2faEK9Bwh
X-Gm-Gg: AYBFou3U6o/+b/tbTtWB4ld62cgrS3Hz5SJK0LnZf3537BRXKxVFW3KtcFhnKFhk2a8
	wH1bEOzBQGkWaLkfqXC37qhsvgVnkFIy8DFvyPTnDAqkejCf9kZPp1z5S0Thcpn1uUxBrlxUD+e
	1i0juj2kBo6/gHCBprANFOQUrBlEYzetr0/l1qy15rfESXaNGyV/5XUynFdrC8hc7ciGcFr8WF8
	zSk5TFG020/B1yiRIK5wXT0jcZXx7+69TqZFUF3RsQLnwP+56Rq7gt9CoGIWvtv2m5PH/bqoSaA
	1Ch+0rC//izUbQPxZu/8r2ci5zfZEKUCQ4oBf6VeOyW6qIzTBPfqH/HDQ+NVEGq7vC7HyhJEd5j
	Ug5mqFJOjvG22Pv4CJeEqhz5hb9l4VHu21PV+KT+O/Pwmro1D9LY0D8RLOtg6u2CoTL4tQQZQVi
	03Dv42CenJDSF6j1D/FgYqad1X2lXZGksinDEKPnpp0Py+mETDYlGMc5NMSPnqieNJ+xf393kUB
	/vw4ACfPTPorIRvsMXn3Cvg0fDb6ki40uh1n2x8fGa49V/h1yloJeDRekqAn4c/arCJ795dd1EX
	PtwOm82VQkXmVu9bRKq6ZBIV8602U2qQxXleuTiA9YayhAQJaDO3kahEC4BdpsO3XRtPqPa7KIF
	vJqGAX54khU2yZ5Xdc3ne/pTT+5iCSWcsyg==
X-Received: by 2002:a05:7022:258f:b0:19e:78fe:9d67 with SMTP id a92af1059eb24-1ac5a680801mr9985603c88.9.1793468354679;
        Sat, 31 Oct 2026 10:39:14 -0700 (PDT)
Received: from [192.168.50.20] (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac194b5437sm19811655c88.13.2026.10.31.10.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 10:39:14 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org, sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
 Shuah Khan <shuah@kernel.org>, stable@vger.kernel.org
Date: Sun, 01 Nov 2026 03:34:41 +1100
Message-ID: <179346448183.4.15545164251841296990@gmail.com>
Subject:
 Re: [RFC PATCH] selftests/damon/sysfs_memcg_path_leak: define ksft_skip
In-Reply-To: <20261031153858.84302-1-sj@kernel.org>
References: <179342136087.2.16978105493403840270@gmail.com>
 <20261031153858.84302-1-sj@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi SJ,

On Sat, 31 Oct 2026 08:38:58 -0700 SJ Park wrote:

> Thank you for reviewing, Aveline.

Oh, looks like I forgot that. Thanks for the reminder.

That also gives me an idea: maybe I could build a modular tool to help
write emails. Building on b4 might be a good starting point.

Tested the non-root skip path on x86-64 Linux with Bash 5.3.20:
the exit status changed from 0 to 4.

Reviewed-by: Aveline Noir <jm5905938@gmail.com>
Tested-by: Aveline Noir <jm5905938@gmail.com>

Thanks,
Aveline Noir
