Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794644883;
	b=xBhXyO+acNvd8mwATyoaOHefTtw9UB0Yo3y/AYa7Jg+69mEugKi93blLcn0UGE0YqJiw
	 T000Zzw4Fdc3JWpLhG5Yy5Xcr1tBNjzDdQcmuMw365FTatOALA6B1g1GHmcVH1ZhTItHS
	 VwY7SVR1S6T4WqYRMaBVD13DVBhQn0G8ubKDZYu/Xo+1TFtxdN+1pap1GXYzpPGLCaVoD
	 QAj370A/HcgYpidL6x7Lc9Ni6xWXcJZP+0+gOwGmFY0x0pke8lVfdv9JOAltp5fKhkcIb
	 v7wyihzlbEjQOgZyDKvytIXVQ1JuXFnUXA0/nhlnTQaVyeWDfJS+mX3tGNZwKojXWfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794644883;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=8gHCfmiGqQPfU62xPlRfnq+u8RwNgFNlDWZiEFQPyrQ=;
	b=rJwJClSczAlmD8y8M4VchWA7qVK7q4NvS77QTG/eYzbF5oFjXv2ZaAAEQEK9TUvMfRj7
	 CERqCTFkyrNsUR/OZ8u9zNytOsaiAvjwiRrTDKFwAG9XvjxTWRDlrPe9QAbDcRCe55DJZ
	 NGhGRgeGLYUqGb/woMOI6ZDb6WgM6YV+4eoABxYA3S6+9viHyce3Wcc3mybQ2iwQqMCr4
	 KLuse7r42fBgp5Mx52p5YZt8M6zP7SEjuvOwR7iKeRf7SEn0AVQKkxAwsgw9mNskCwA3s
	 PganIQAG0VmH8tpTqGw3SyUK7KehKAgQ8Q+BuqTubOoNWsn90tmQrHPm2+FeUhp7hKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YcE1Ljt6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFFD606A327
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 08:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YcE1Ljt6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97AE91F000C5
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 08:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794644882;
	bh=8gHCfmiGqQPfU62xPlRfnq+u8RwNgFNlDWZiEFQPyrQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YcE1Ljt6epSgEly5U34/+QR6tkGf0qcgcV6KULQXKWynM3vdfdbKNblapq/CTuGF3
	 ITCXavSOx1maFDdqAWDrLE+9oZr8oqTl+gKVJfYHBAvS86QPq8Qt1iIczzr3mfnlJ6
	 2CVv+I8UHQS/lRWxn1w02tguJPxKHNz1x0MEo2n+ekF0Aw4CrN9GnkBZdq5LDkYcn9
	 fvxndh6iJcVY+q91CO2Z1Rr4AzfWIBazCBIil7zUBXbzPz/PkcUF5zDIa9Wupq0ES/
	 GbDZwZXW9DOYcsPGeCiiRzQkXi7yB9RA9pS/oEcc0Itje2t1TSaW/l8dbuO6orzzY/
	 T74XIdMsYi1Dw==
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93a40a9a01aso483526285a.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 00:28:02 -0800 (PST)
X-Gm-Message-State: APuU4Z9sJaPki8C12MClwocwzcIMLhnnOSWve2eFiDLJYGbzQIoKa3rb
	CpcLRgJ7l8yzp8tKKdpnpV8IwqLf078mhd8XoorLJOcFZZvwzKojiq4K1y1/SYJHQjCdmWy/iR0
	YcOhAcZ9l2yif+ygZ9cDRJ9AzKG8wxwU=
X-Received: by 2002:a05:620a:444e:b0:93e:c12d:4eca with SMTP id
 af79cd13be357-9493316e8abmr1273094185a.42.1794644881841; Sat, 14 Nov 2026
 00:28:01 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113185541.70203-1-baohua@kernel.org> <20261113185541.70203-3-baohua@kernel.org>
 <sashiko-outbox-214021@kernel.org> <CAGsJ_4y0KR86ABy5-Qpmk0ws0LMXB3nZTOcnhPL_Orr1_f26-w@mail.gmail.com>
In-Reply-To: <CAGsJ_4y0KR86ABy5-Qpmk0ws0LMXB3nZTOcnhPL_Orr1_f26-w@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Sat, 14 Nov 2026 16:27:50 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xbDy8Qy=5yqmn+59jfxPm3WOgAH7zX9gwhJyO-6fiT6A@mail.gmail.com>
X-Gm-Features: AclHuK-HHm0r3_yTuBm_b7NDYPGgc43xeC8btPUPpzMn0jANzlAyNSjN0s2JVcw
Message-ID: <CAGsJ_4xbDy8Qy=5yqmn+59jfxPm3WOgAH7zX9gwhJyO-6fiT6A@mail.gmail.com>
Subject: Re: [PATCH v8 02/16] mm/mglru: extract lruvec_populated_min_seq() helper
To: sashiko-reviews@lists.linux.dev
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, hannes@cmpxchg.org, 
	hui.zhu@linux.dev, kasong@tencent.com, kunwu.chan@gmail.com, 
	liam@infradead.org, lianux.mm@gmail.com, liuxiang.277@bytedance.com, 
	lyugaofei@xiaomi.com, mhocko@kernel.org, mhocko@suse.com, qi.zheng@linux.dev, 
	ridong.chen@linux.dev, rppt@kernel.org, ryncsn@gmail.com, 
	shakeel.butt@linux.dev, surenb@google.com, wangzicheng@honor.com, 
	weixugc@google.com, yuanchu@google.com, zhangbo56@xiaomi.com, 
	zhuhui@kylinos.cn, sidchintamaneni@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 10:27=E2=80=AFAM Barry Song <baohua@kernel.org> wro=
te:
[...]
>
> it seems you are suggesting the below:
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 18a3332c71e9..307a7cbf5bc2 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3995,7 +3995,7 @@ static unsigned long
> lruvec_populated_min_seq(struct lruvec *lruvec, int type,
>         lockdep_assert_held(&lruvec->lru_lock);
>
>         min_seq =3D READ_ONCE(lrugen->min_seq[type]);
> -       while (min_seq <=3D max_seq) {
> +       while (min_seq < max_seq) {

Discussed with kairui, we'd like to change this line only
as it might save one iteration.

>                 gen =3D lru_gen_from_seq(min_seq);
>                 for (zone =3D 0; zone < zone_limit; zone++) {
>                         if (!list_empty(&lrugen->folios[gen][type][zone])=
)
> @@ -4004,7 +4004,7 @@ static unsigned long
> lruvec_populated_min_seq(struct lruvec *lruvec, int type,
>                 min_seq++;
>         }
>
> -       return max_seq;
> +       return min_seq;

for this, we won't change as we'd bound by the given max_seq so the search
never goes beyond it.

>  }
>
>
> it seems to be simpler than the current code. let me give it a try.
>

Thanks,
Barry
