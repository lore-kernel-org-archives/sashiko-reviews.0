Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793137022;
	b=HLAtDDdqGVhmdvysDw0asTa+6LwijsqKs8qR8egyb1TyDSQiH78152Iu9EHBYmtJtMiw
	 cNzy0Y94NAUP1aZjBz7oXJqhhdvdn8B0g/caHmKI9NpYpq1Kp3NPJfxeQFSCGvBK7GOvH
	 KW+AgnV8ppjw5JOl02hY2DgpikcVNX2wWEKbb/Okyxb3RKjhdHyeOJrJXzau4ggu+oU3L
	 e9fANmQ1BF2uCC6NX5aBr1aCJukCwl+5SIuYsGVoVBFw1f1m3RIsqpm7L0aZZmvFlZ8Zh
	 jgsxtYbQML0Za7I6IAqQtX9J7VMYroXukG5L2gU37GjpI/6kWY4KBWanfR96q+RjzJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793137022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=QwA00Xd4JXEeFnIr0DG5m9yuPCRBZ016UAYczoXmdAM=;
	b=44r3bJG557chF0mQNLAUFfnWeu4wP34R4rqTo/yzdkoRKS6LZBn/cIFxkT0LhBGOPu5g
	 fd4qEjv5kxiTKjdJF8xQkicnc+Q32GpeRr6Bu7MNp6/K0fj64n/RDJZQCLVXiWGVmJBAt
	 NiTa2OlVyo2w7OXSawznPFZJZAB5aj+uIvvTZGqOr3UglKJg+rIRnmlqQtQhM17XqRlmi
	 3FAshw7VQmYXGeR2pJPopNk/ecgy7vElqt3Rll0rm2TydDj+F6b4lPqGZX0Vuu7VJv5UX
	 ev81rPWRyVPYPJZvxfnymBX2S1x24VUeT1/g5OxJ2+DDqno5wWt11hKMnWMH9x/6D6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QhYw+VY8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48367606A31D
	for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 21:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48367606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QhYw+VY8
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so586809a12.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 14:37:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793137021; cv=none;
        d=google.com; s=arc-20260327;
        b=bmcu9KfFjYb7RddqLy0QjRnS5NC7Wi9i/DxXJVOlLs5BFOdwwBKIhUgRdhiqB8ahJo
         YhgCf/LtaN8zG7vxl7NIC9JfRQ4JOgqXboRYfxnSP3HpapSpedHCyEvoRPmBDhWiVDRB
         P4YqRDtYzwBLFd5TANvgYRrVJFmcKwLJaUSQlzxkyakHlPXLbaSyQ+0T4MzYZM1hog4l
         cYxHQoqNLNGFdFLJtZitQSXGZm4l1BB/rYr5VkqUnHSbP8bzQvULziE7uEvF283uYYaF
         PP1AHQYtI2ghr3lS0q3H6vgfo0HaBkweq1jYtpFem81jP/gUqcggzZ0AVAfQ3JKhfbU4
         yRSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QwA00Xd4JXEeFnIr0DG5m9yuPCRBZ016UAYczoXmdAM=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=CRlgP1rcTkTw3b6WwrmxPkprKSPL/c6clx/HgxrI1Te6W7npiOGF6za+9ExC7tUGua
         0nqd4A5cYxIrFsr8SdU+s3rx8OX7TON+9k8d/mHiAD5l7LvtzWjl+l1zqb8onwqTG3Ct
         +KzmUImyjglK6vd4puNcKYQhyWgAU7gl/I9jOOwD3Yvo9o6wjg15rWgv8dOP30x/DsK2
         lHJwPDJS22JnuNlxL2tkfgcPQwvR4Ut9IcaNCaIt5K3He0DCGDUwpfXJgfhI27M+VOmc
         8kCfBoUVgOU0HZw71HqTF4Ho2V9fxHhB2RQ2+d2fK6nLgyGBOuFkYc72bv2wyLbszp9M
         Kd6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793137021; x=1793741821; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QwA00Xd4JXEeFnIr0DG5m9yuPCRBZ016UAYczoXmdAM=;
        b=QhYw+VY8cje2gsLx+cisQIIr+YrvpjZjQkSHU4N4X295mx373v1IL8X0anWdThH2yc
         mZJS6GwZqA8fiTnCH/JulVrpmUmJUOapFV0ATMlJsoW4EOwqGj+hc6hRQVrcRY+xv7H0
         hduvcbtSJjzJZ4eCpcYx2hXg82dARmaUEyblepZWXMzvnN5njyug54kh49h9xunX+dVG
         rxwiImmUGQTSq/6EBilP0krwg6VQfI4zTt28lcFJAtKlQOTgxeOlnwG/zVOYSk/1K+hh
         PvbRLggBxfyrg5UsCuB8mJnzbHee/P3mXnKV6E8NxUIvOeGVXOLUIb/zP4hNgcjDC+jX
         COaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793137021; x=1793741821;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QwA00Xd4JXEeFnIr0DG5m9yuPCRBZ016UAYczoXmdAM=;
        b=Ty/16dKcyc+TqBuOEkAnkIzD19Antnbkx7FHYwTRLBavceE5+dExi2lgmw26yogjv8
         OpZ+sqPEcETQ3UXzQnrZc1zv+YzrhRju70s6VUM/IVQsJZvw1B8xK1Pn6MQc0332N65b
         VgAhjxy8jEX/VUkuQI2Je+IzKYFD2q8utYzLpI/Pj62DMMWdbd5B1JoTZ+L0N4tDsf7h
         23sxVorWskmyduZ7S67Tr8bxgIAcxLgwPZDA98qegKuklRRmtKx2BCpgVegngvM9e+4e
         oOBXp96VIq7ADevjAn+NGF/OgXCsoStCWWkzsVQxNnx6TXeAn4prYCqc1QKXQWnfD3Z9
         mJjg==
X-Gm-Message-State: AFq9FYJIaLE95hRW+fAOZ2U3HPqYhWDLnYC8ih+25zwBA/HmyglVQSJB
	Cb49FXnNNp+jVdbikY6IoyugRsS2nKKGEbF6q51Zu/qh3wBrG/8fRIX/dbTYLlgblngmA64KIHw
	D5/tyEmUAx2II8baGdq+ls2o4agRjBQ1mzeHkeUGOyKGMr8ElhZn0H7WI
X-Gm-Gg: AYBFou16f79w262dFIerDwYhNovdj5FwSDSZhPybj6TO9TL/kqC6jfmlWdd1O8nWmQm
	1s5XxwA/TMAzhRS4MU36iXFbK3mue0xDVxX3uDr7VFugeo6V9uz7x4/rmqBbWdkzhjJLG+QviwK
	iNYEeJdKkp2rwLkiXKGHkRclN4azwMlZ96HuhUvzlEJUNk000Mp65axeOm69QnLO+xEUuvSAWB3
	NiHHflRYvoF3kNUNOzKKfjZzXRDCi/5RJnmctZfB8JUKQCp98t+NVLXm8zNztysCKkpGAX0UpxC
	IKcgYby7WvwwOH/E4tcb39coZeazPvIPQ+fPBRZzDImqUaqPXeORwNqx9QgHw/ISc6DTJIIj8EC
	rjAiwrjd1AoMsNc75QOfP7aiuIouzrm7fRiHRQLvpOeaff+4LS6hDGJvCQXmDt9If1Jr0
X-Received: by 2002:a17:907:80d:b0:c45:b99:f282 with SMTP id
 a640c23a62f3a-c49bdda6ee2mr44119666b.7.1793137020271; Tue, 27 Oct 2026
 14:37:00 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-14-wusamuel@google.com>
 <sashiko-outbox-182165@kernel.org>
In-Reply-To: <sashiko-outbox-182165@kernel.org>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 27 Oct 2026 14:36:48 -0700
X-Gm-Features: AclHuK8GLPAIRQVXEnBkwQRV5iqj4k08I7nT4WWyk-yc_8Brz4DW--Dc5v-8Mlo
Message-ID: <CAG2KctqTH6vZfgm-7ohbxNOmKOcpLUJ+7GPxysfSmUnaBHGiZQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 6/6] selftests/proc: Add KALLSYMS_QUERY tests
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 5:25=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

[ ... ]

> Should these three skip paths call ksft_exit_skip() with a descriptive
> reason message instead?

Yes, I'll update v3 to use ksft_exit_skip() in the three skip paths.

> Could main() use the kselftest.h reporting helpers (such as
> ksft_print_header(), ksft_set_plan(), ksft_test_result(), and
> ksft_exit_pass() or ksft_finished()) or the kselftest_harness.h macros
> instead of raw assert() and return 0?

I kept assert() to match existing tests in selftests/proc/, but I have
no problem switching to these helpers if maintainers prefer that.
