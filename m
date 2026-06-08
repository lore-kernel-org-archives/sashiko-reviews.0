Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C42330B29
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 06:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780901065; cv=pass; b=RkRfDbuuTMiciXVUi3139JsuBTRTpEVG0N111LQwC29KOJ2Z+iK4AfdYhhCdvByhUefWiCmJkCQfKQ9EpPHED3XL4D+OTks2TO2Sb7tDPk0/k39R8pGsF41wtlMSUE+ANXNTLqEhQMN7owcdX3VDkDvZv2titQef5x6k6hUP2Ro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780901065; c=relaxed/simple;
	bh=Oq8FO0fC1H6ZktnwW7vcFXmDVxZ7+6PflK8V+/qjneg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u6sEawWsJSO0/K9CrQ6cP5zDqsQxuszMQklSfQ0OvB9hdQv+NfoHPTSezQc/DPmDi/4rRGEAzbFHahK08B9UZFJSj10syc+XCmiNOKLG7Q+pv6bD3sUfLH6cElP/7PgrNt6UIeupXHqFCVvxWyUz/xdQBa4uaa8R1aj002Fy3j4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXUPgk78; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXUPgk78"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c0c20f0c0aso28794025ad.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 07 Jun 2026 23:44:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780901064; cv=none;
        d=google.com; s=arc-20240605;
        b=AJiuWMdMCspzj2mk92mj9JXrtx+9AJUNT1Eu3/Mxw+okASOMKUGdjRG7//X4m1CgCi
         cyWs17EfUxdKSYRwvKsCZK+MNClHM5AtjkZLaVdtcbP5s50FKFhLya6m5CUlG56KB7aj
         DqDXZQRYrGLHx6Z31+QWh0hnyJ/59Vwre1AMJ4zKFEvnYvxLReHGGgAlaHAmYOI9BA4C
         uMIgmdxw8h5R9ltO2RtHDIdXunFZKxRLM2flfNK//zUILLpggxnT8CEpzhqy1xo2DwJT
         YW0KlUSWG0J5fguKDe5HC5UdwAasKm+sEPOsqejkzcT4ob7q1Zh17Q5xk5w7A5SXTnA4
         BZ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vrWdtJmKVKxWjz14Kp6oiB9mB0ijBAp6gqBi0mv7EVI=;
        fh=0hdvEPJRino8wRvGrrw1gATkOs6ExpSix2L2F38xNVA=;
        b=iMJD1n78X/Z+azlIBvLwqF0VfEHAyoN3tw4xDnxRRtCW1K5epmj6b83L6BV6Wuh668
         TtfGX/Kj4jbX+aBkg4XGM4xJfi7VvY44mmwp8yHG+ahTb0gf56EeFMZ1vK1UxtFH8RRN
         dWvRGRxVG0FrO7aN710mjeG0hName+FB81ROrJ1ueSrVn6Nh0WSMxcay7jDlXHGyvQ0m
         QGCzkD4qU6vZWtLvtCp+3ZbMRLbm7LltJNpEXHnnjS3vZ1gVxKmZDqCnhTYttgkzgmqu
         WcGYKaea73jZ9RRX2JLntjLKpWuCrfCtqORIHrjkfEUBHMMCOL2dalJEuHrb4M8jyihV
         z4wQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780901064; x=1781505864; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vrWdtJmKVKxWjz14Kp6oiB9mB0ijBAp6gqBi0mv7EVI=;
        b=LXUPgk78zsM3FMKYDvPPXX9n/WdvLdBPZMWcufvFfPOEyK3j9XFauBVdv4mYJhWK2H
         MAE6jAgdvLNf8RWUmJbYx9qtV9PCDYdIrjHuhub5N6XbzsjXEd29H8sxxJSo77gy7N3s
         zkyQaVpVLAk5vcymseEb2m2wC86vPyfOyxae/DaR9eoUlxZZ0/ZXJ1Z8QqcZgRDX5XnE
         3KIAyTnJ+5ySXhGUO/fjGgaHrLw2ZZmP9n6yazjPxfXkMDXJhchiIHxQhpqpwjNA916v
         KjI318j6DwnCWE24W5sIHtIoWWW64DwS4ERxcNVfUL1HYm4ToqFsxCZaOvKrkXzlbXr3
         DWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780901064; x=1781505864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrWdtJmKVKxWjz14Kp6oiB9mB0ijBAp6gqBi0mv7EVI=;
        b=hjHJ4dGELH2PzmQF/UYp/+2y/IWXYir2b5txaUk+Am7/WoTbVZzMKsPiAgFWggkxQH
         /Qvz+b+tUqvqrGFtOpg3oHmSYmQFEYAJkTCBu2GOrsbL/6P8mMGl/P8ijMt6B7fv+vQy
         Bdk777qyK0wK4lfu5LmM4xIijjNcrq6nPBfWEBj/DrfCGCVVD7eeAjx271f2JH96ZikL
         n1qf+Qr8iUqJJ2almZxbGuYmye6Jx9CaziB1h5TQghI33KZL0HoLKzjcdqI8xUqagnou
         1wmWV31x+KGkbMs5EvdGTl0JzokSZpzz1IprMZoNW8R+NMRNZvLo8ECNUew25l/sQf99
         XAkw==
X-Gm-Message-State: AOJu0Yx5ZWCFn55qx0io14c6hrzBMzZSl19Ukh9aX/LUxveBxWO4qBDT
	2/7CuaIKHxrO5G4JH0jlakU0ukd+LdmRFX2H3Ks/liKKPh/syMq1hQuSPNNk/E9gUoVVMjJlgsU
	r06aawGCNl2S0pQ0GJJlafxfKbGqNDeiwxoreYjLNGA==
X-Gm-Gg: Acq92OEA7QvVCSDG2aMVQoxf9vk6wXORj+JNMqGWNAhZ/TB4+dEkzV5VihNiwJiHKZW
	pn11i0Afaz78jIgW48NyIqjZx5BXhNDuxObP0aD50kHt5DZy3Yx/87n508vBVzDRsUKq4hfYgH8
	LpQxAClrk56jE+5Lk8vU7/WmKEZm6J73augSKlzp+zp7y9AoAfH3ztVhBguCaKi52gvDCgEh6JZ
	m0nAyD1rQzuULh/n+YkoOzmOVYIsl2uLs41MJXodhfaCEM4hC3Phsk9C4zSZCuLXemisOH+5Ec3
	i21nLge+0JesxdqPrpJo+rhh7H7FWiceuqs20cxZ8nAnDdAam9k=
X-Received: by 2002:a17:903:291:b0:2bf:2243:d4ee with SMTP id
 d9443c01a7336-2c1e7d33343mr168409945ad.18.1780901063874; Sun, 07 Jun 2026
 23:44:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260608060855.40469-1-eugene.shalygin@gmail.com> <20260608062358.E48AE1F00893@smtp.kernel.org>
In-Reply-To: <20260608062358.E48AE1F00893@smtp.kernel.org>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Mon, 8 Jun 2026 08:44:12 +0200
X-Gm-Features: AVVi8CdD04Ff3IyQb5uLfCPfTYUX69BwSpcrrr3tt1T8_M9letvBKDGdwtOVO3I
Message-ID: <CAB95QASFZjTAqZqaThXL9hB-JRqNUDvdifpJbYxV6iT0X2x89w@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (asus-ec-sensors) add ROG MAXIMUS Z790 EXTREME
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Jun 2026 at 08:23, <sashiko-bot@kernel.org> wrote:

> Looking at asus_ec_block_read(), the inner loop iterates over all requested
> registers but only skips past banks, omitting a check for future banks:
>
> drivers/hwmon/asus-ec-sensors.c:asus_ec_block_read() {
> ...
>         for (ireg = 0; ireg < ec->nr_registers; ireg++) {
>             reg_bank = register_bank(ec->registers[ireg]);
>             if (reg_bank < bank) {
>                 continue;
>             }
>             ec_read(register_index(ec->registers[ireg]),
> ...
>
There are only two known banks at the moment, bank 0 and bank 1. The
condition can be replaced with '!=', of course.

Cheers,
Eugene
