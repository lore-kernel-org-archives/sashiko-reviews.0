Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794256665;
	b=CdDXyV8LYeE9uGJIx0W9J5hW7+Mqnkyqiq8RzXp+Cz19aRKztiwKTFwgp6txNBzrRc70
	 yLaUneY0jwISuSDuWBYUcI4KI9NhzEd/FNLEQwKsLl+5wmMXM4GW9K4M1GvJXcG+5Eujt
	 qU6ERVdJ09V4b9y+nyO15KqMD03ewXYBGMGEWY2JccWFwL6jLt9Hgj6EHPtp5HVbVNmYq
	 590+1qy2fWkwbSxT6loTapM2Gua7oWpNBRA7vhOQXKs04Mm11T20YvZGd6g1pJhmtHokW
	 xkcJBsek0p+MxjPbbp1krazIhTYSVJtiUGYWVWPTdQam88bw6Rdqriuz4PwHgj4jOJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794256665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=3VnwQPCrlu9xRWyyUGXbolYTbPxkn6lPaAfhcAqhvX0=;
	b=Ge7o87Neqo4FApqOMnp1yGjyFgyAqSnTvlXrVL9JsZMncf+9MmJG6BYudrKCdqgbwDhz
	 +W5MF4d5MnbKAWKTeH435ZgxjE+yYAnJXFpiT+K2NWZdXPC0JVEw8E8wm3z7ch/tBgYa7
	 dpjqf+FqPknJRxPXEL0D5qYfqrInAKbFgpIJGNzpKDW+C5OUyvnLTiXGWu4Yp9n+OU+DO
	 dwcIZtOKLffFjEdSa5FpFINNwFmmvYfTgq/I2n3pizkWvoQzKzwUjoRPRZ6BxF+HVFC6s
	 9Z8O9nTZA+LzwefvIZNFBEUj6hpt2XV2mtfXNfkcBL6AcGR9HMBJ8jHIAA+2C797UDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BmlpPIVa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D66C60A5BE1
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 20:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D66C60A5BE1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BmlpPIVa
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-499f20c7054so626104fac.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 12:37:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794256664; cv=none;
        d=google.com; s=arc-20260327;
        b=LyT4NQgrPG2rWytDoGd/iOUBx1rSLQvSgdB0lS6CfAqtK8lk7XTie0eerSrBJPowH2
         VmS/AvtZkUS2g/1ZAjn/q1ccvkxSlypk4D+K1MiKhlnSMpyBJZbV11SLC1BeoaVQZgoB
         Ni6m3/o0aGCWiowGO22GFOOaw87FJvJIAkjn7LyXeXSW0y6Y4qiAnS6usmyix01CG4c9
         xd6AeXToS3WYM6QDVEAk9Y6+md+s+z/cY/QxhFNVONuhbQlr50RRkIxUfNsXkeOblam2
         GAzLsgpOEBWbBoQ5KNQL/a7Syg/SUyOz2HHEb/59E0B38tHWT0GbQ3D5h98Kq2tDmG4G
         TQdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3VnwQPCrlu9xRWyyUGXbolYTbPxkn6lPaAfhcAqhvX0=;
        fh=Je+XfjZZELYMeUFG782y9M4oZFPTVtwBgMoamcbwTg0=;
        b=ZG/xjGhOttWmCZJiWTfv3kKeCefPv2fpz9PeheH+VknOdvqTo/OPY5zDN9fmDj++Kj
         mPBQh7pse/swzU2rAcId/n108zsa0Ni21NpWcapv/mXloD9stOd96MUM+d70l3nCf3bC
         GxvHm/YTovWMgtB3IO4vfcCMwefuxz66JPvDkh53UFlwUvxfXWBDG5IZOonu6TKPth0F
         1Azuz+gRXo9jEnbxSowzNvzedmj6hL0e8gVGySRM4sOqYU3mKaND4sfSY1Vru6QTHeV3
         JxhjDawR0UqfZuAFblPEzcOn3APWLCVDgpU3+HejCljuZSwWz3zlZNx9ldRWtXftv3hp
         x5jA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794256664; x=1794861464; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3VnwQPCrlu9xRWyyUGXbolYTbPxkn6lPaAfhcAqhvX0=;
        b=BmlpPIVaHlpbEvvMmRlOmnCcEQwetVST+ksl57ozQ9GmxXFK5bognS0rTi8f1K/7t2
         lqSe9zkjp3ojdpulNejhMfiGBD8j7BSgKk9kA286lncYmK7ugOpgMFo/ObnJLE4GKAHA
         y25uUuv27bq/+iz1TkjVXhZ2OlnxQLJjBUkM2DNVCWJCdvdZHVjRaumuTE5PC12FW8Us
         VrAPvGt58ou4qhdRCaBTeWpNx1ZmgX3qa7kl3qJ1ng8KsFYk8dsoGS8jG2/inmqxEY78
         ao8I3qHixo+6IWLK3MNBt3pKrvqnumwL+YRQH2g8+uKIjjmaiP6MP17GOOZbm1UiEUEz
         nhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794256664; x=1794861464;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3VnwQPCrlu9xRWyyUGXbolYTbPxkn6lPaAfhcAqhvX0=;
        b=aArtNi+suZW4LwF6tvBs3ikuHLtFt6LD8iIu/Yl6BOFpfCbD3A6HyMJaoDNg7RhtCj
         unNOkZUyepDZwlFZfVJfOgYMq1d2wUn2btP/3mPFDJANP2raNsaHLuU51biUIRpwlMy+
         fwqxbTdWSV0o1qdV1pT2JKdHuLUYtLkRdhMtgpNd/14zIyVMT5mJ+BWXho5m+vWo2jLa
         DDcOVznKwCBqDbDYuhuN82T60bZNu/4AUZVp7tViCaLf7CkT9yP2L41Hoqxuq2cbTC+X
         PmbD75B3uORSBqYTkXYzBAiZCtLxsxKqdMYP0MLNPiYmeapLqXHwVSW2XGDFXiTLAb59
         H0sA==
X-Gm-Message-State: APuU4Z8kikBSGyrK9n3a3vQ1lnAXJBdhv72/tOg6BaIzSjKNlPOMI2i5
	q1A16wJx6Wt7KHt1OuzjEI3JMipUh72K5DMXx5T7DWjyYF8+8HwhHmLedaEkoQL4nVctqANy0H2
	Oa+3Q50F/i/Yad1H4cHlx388kfwUimTi8uNPvFXtA1Oe7cxab90mO39zy
X-Gm-Gg: AYBFou362+5oUpvNBJoYkXy8Ostt8PvtuVjzk9tMP/ZqjBZPhgE82obO9xxvu/u8Cf+
	YJkemj03B+DUUzBWa9zlHtsnhqwYF+F37ZEi5dSxD1DSmfj6Om5SgRcCDmoWphUPOBZhZ6fAirn
	6SIay8m4TdE16FBGbT+Q3zOL2isux83Ucersinfh1wZjHYrALqwAuMfArvdUsuSzpUuo8qboFb+
	y9FdXsRae775makjAVIh04vYBK7SMeX+7Ty7P5lZ1WC+b/m5q6hDcdjgaP7CXG/nsnQ1vEC7acS
	Qr4Aw1J25ZqUB2akohx9qoZJz8FO3qb7xYnp/eWjm0MuZKbWuO7bvsULQS+8vof5r/+alZwOYo2
	oQWJfW4do/b7fZzQv0UaoES6o/41BXYmbTb6ur/UYoowIc6xjBnSQ0zPu3CQBlM1Xk3GTgfngcW
	e59Vycjg==
X-Received: by 2002:a05:6870:1719:b0:4a7:4263:4079 with SMTP id
 586e51a60fabf-4ae222f3d0fmr232893fac.5.1794256663889; Mon, 09 Nov 2026
 12:37:43 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261109202525.2937295-1-jmoroni@google.com> <sashiko-outbox-205588@kernel.org>
In-Reply-To: <sashiko-outbox-205588@kernel.org>
From: Jacob Moroni <jmoroni@google.com>
Date: Mon, 9 Nov 2026 15:37:32 -0500
X-Gm-Features: AclHuK9nrr9G80lOhj9J3N4JbMhZzHwhS0ajNPYstkexEZ9RC53Sc7Y35e5cFaw
Message-ID: <CAHYDg1RcDU6mBYyuE9CE3pHu--XZoauv=2v6ZwBNb1tNYxOWwA@mail.gmail.com>
Subject: Re: [PATCH rdma-next 1/2] RDMA/irdma: Fix potential UAF during SRQ
 limit AE handling
To: sashiko-reviews@lists.linux.dev
Cc: linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Yep, unrelated and will fix in a later patch.

- Jake
