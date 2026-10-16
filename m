Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0F0387596
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 20:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792180836; cv=pass; b=P+GhBO9QimO9faXLGzRxOa8K3LIQQBco6wJYO82l8KBK53ozwmb9VwLzaeoIyFxg1lj97L6miMPDuUYh7XAAD4l+ngWOa8ImXfhgKa7T69+4JQKSTg9whxOp4oAyGXrpFwTOK3DeT3/HBbfueqLE7EG9sijUS3zYQtd9hVvsPtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792180836; c=relaxed/simple;
	bh=Xd6WNmGnzFYlFoHsuTFHOu2fkEqtQQlZiBMErqBBiw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rvVtuMq0dEnUMjtyX+A6HknYcv1tj5WEDQvK2ae7qjSXwh4Gj5p0p0CKTWhdNavKwSPv9MOPPQ0Vkb68SW2JbTxD97QfiAyvkmKyVhr3RBVUkPZ4YNfgfIRKSkKbexwVEm5NXf8GdZnReae+2cNzYqaJT4gq0SoMC7X1AppTt6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qcOpUDLC; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qcOpUDLC"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so2676a12.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 13:00:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792180833; cv=none;
        d=google.com; s=arc-20260327;
        b=nEFar4lZ2HsvuHq7rstwvlbFXqq6OUiHWPsOh8J96R3+yxdVI+HKoUo5+8cZ6TpuDS
         Nd4jt+re1RIe2PNNeDb37xgagKoa+owLlA1LTdycUs/p64ZZPeGC5xfwtIrnJ9WotCzk
         0yEdjYVqvg7wHNNWxg+aUkNoudzHTUdq9X1Zmou5rIdm5d1V0voVB0gxM03vEfoJcsZh
         mr2C/oFnAXCLQ4oSDLQpipXmV1WPQ3+q/EytDlLW0P5C288CMMzm/+3+IglUK8RkAvxr
         vdUO+2p2hbPiBV6hDN79SLYmynsTxDwrLTttb/OQTFRhgYuRNMWrQtzP/poVCIP/UW2g
         AOVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xd6WNmGnzFYlFoHsuTFHOu2fkEqtQQlZiBMErqBBiw8=;
        fh=YriQdl2X5LbjnnAYi4/QM2X/6MpOgfc+mGWKpf8Terk=;
        b=DDG5UA6AzFOeKFfE+hiSim1s6/DXjXf96vkWb/95AffdB7hBe2AOOSCPcOPv3vFdMa
         QCMSlmtOMntL0w/fAjoJQHSt61FmqAPflHHnc7ak6yVDNrbrhjuBU4A2r32DkYzPc+zs
         AXxuOQ3YHWB7rcIU+lI1KS18sEaCqy60/YB8TGEgZ+rJI/Dj/xI+PaV/Dc7hU0FpgG5t
         lBH/DjW2K7Pm1Cx0S/tiNqaUHiMaz82+YP0B6guSsbrInBc01l/3jf0pQHnvdsfOz8X6
         2OdxhSB3dz4lRImn67hVUfSwcqStk+NEBgNQ9xSrUgMpFiCX7ch2zv6+/xfXvdOkuNw7
         /OEg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792180833; x=1792785633; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xd6WNmGnzFYlFoHsuTFHOu2fkEqtQQlZiBMErqBBiw8=;
        b=qcOpUDLC3oHNSFd60Cde/j++yjTLdzcdbuZhHm0qoGyqRj8kwCMkoHsyK08WWM1bjz
         GysNVrUlF3B2hZlqzLLMneHAw6vc3QRU7Mi0vkwl8vSW4saMUg9mFzod+X50IEtZMP2f
         5zJ6iSptY3scZ+0kcuxewZDkxj0DAkiry7tdFFSnlY1ZXbubQWpaKS5tg44ZZjQlfS6R
         LkgeWdnfEbTA2BoNvzIcHnUmS3NTcTHPZAPr3WLnolnqocRaNcOAitS9BnrT7mr4Gc0A
         Bz49isg83jo9MXcIIgJrd+gFBn62q1ADv3OLeoPg3DKThgpyhYTKyTaE1+vq/eajpIY4
         Gz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792180833; x=1792785633;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xd6WNmGnzFYlFoHsuTFHOu2fkEqtQQlZiBMErqBBiw8=;
        b=RKqUMNu6wC2j1VCk7QLcrbYTguB00HmME407Y9cQHv8L0YNNMX/l+FKQOso1ro2BdO
         Oa5uykh7WuQWE2XDsoiyARlZVORTNbpKwHyIOOqQtHXFxnR3c7PvigxOGjQB/X3BMjVv
         VwC2M+qR4wg6NZbRgddE05mDNsfkrUoZI/nTztBd+Izqc36lMXeuf/tiqtTG2rWZZzFu
         ClGL/VQ+kL3Lr7eYrIJjglzdTKH6OpTDxK0R9QRNyd3AIehOW9NPbahsXl0sysXh0LiB
         zE5V9MtxMSYQGB4oYQVnHsxmd1jsxzP0vzsOXUXNNZpSsQzYrykTOJH2H/OiBr6s9wpk
         FjJw==
X-Gm-Message-State: AFq9FYJIihgFAtQQn9kfq0rJCfdlDrAlS7N2DY4oa9gy8jrSWHMjhGxy
	8Q1qkGGNcM2nK3047aaY3+2cV+5BBAt6V7+src792cReywvvs0YyOenTBCb+Hi09o9P/eAm7dxj
	c20JOwn4IvWY0RX3QjG/CKiK+xoit7FeBGboBJn0XmWUuDBpgfqF5bQMR
X-Gm-Gg: AYBFou3Wmr3M9niWjkyrHvM5EjFGfh5UcB3638SmerPA7DEVaNtvRnC20qVOF2mDduw
	qQUCHksJxK+UNIrR4MYXvB5P2QDvAPtYAiToqfudDAIPPV1hmJTOvdUbyrs4HFKfrvbRQAuDs6e
	h/U3aqGOSwjQjy2YZvQ7wFFhO0gO27s/gdOkrSa9z0keXdelChAYysUIL2EPjZtX1bCFZJYd/TJ
	/QsUBGWnSglonoXy0svR6avqJhPxDYsP7XwwWi92jqRVHk3lCuUj4+qVRK97Zsz/IFWGnBfj7Fu
	5+Z0mB7d4zqdu8P5zX+U/5Hvkyqw8yzsM+JKrtxxV7asollM6gU5bQ==
X-Received: by 2002:a05:6402:4406:b0:6b3:874e:1b6f with SMTP id
 4fb4d7f45d1cf-6b3a887003emr14330a12.2.1792180832701; Fri, 16 Oct 2026
 13:00:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261015163915.1166043-1-almasrymina@google.com>
 <20261015163915.1166043-2-almasrymina@google.com> <sashiko-outbox-174651@kernel.org>
In-Reply-To: <sashiko-outbox-174651@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 16 Oct 2026 13:00:20 -0700
X-Gm-Features: AclHuK8Y4pWXf1mHB6BN61Lfe2Em837RVtKxg99QRS-eFFDNTF4wSL40Y1Cy2OI
Message-ID: <CAHS8izOMzQQ8pXkZeXz3+TZfxATpyh0L00KGJWdu172tZBLAcQ@mail.gmail.com>
Subject: Re: [PATCH net v4 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, media-ci@linuxtv.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 9:39=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] net: devmem: UAF due to leased queue mismatch in mp_dmabuf_devme=
m_uninstall()
> - [High] net: devmem: UAF on dma_dev when physical device backing leased =
queue unregisters
>

Lets see what the netdev sashiko says, but I'm yes, I'm aware there
are pending issues with the leased devices in general and during
revocation. They're prexisting, and there are too many related issues
that my series became unweildy. I'm hoping to follow up this series
with a minor rework of leased devices to address all the bugs there.

--=20
Thanks,
Mina
