Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C534A403AFB
	for <sashiko-reviews@lists.linux.dev>; Wed,  2 Sep 2026 08:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338868; cv=pass; b=DSjlfj0y7lTxPtMRp6gFR+v9KfWPqN8S6ceFS2cYPA5gnaPFFnJElanR3867IPbThPKavdoOUITe+TPs8+qysRM9dTiHvLcJ2ujPzQYYFTHyskabep22F/lEjc0+EJmZvS1RdS1hye4X4ER9gg0A/piAeGZoY5h3TDQ+5Zk83n0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338868; c=relaxed/simple;
	bh=MYMnfWqyZs8fhoupAqZEoP21jVypdUTvrAIwa7LBw+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SoVSSYpRX6rm7pSpIT0rsHvFOu18PaWlML5vTBtiS/Jx8mG7D/1ibBk2ue9vTlvHTzZP+vKm6nKUAe8kgTCnnkXj+fTtWdvMtx4aBc5/ZF9WGJsq4XbHVvJXKCEo16t4C+whjcrzSfR1n5SsOODTxYl33ujyT+t9V4qMquHnIKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTdVNV21; arc=pass smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTdVNV21"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6b1b881a8e9so314468eaf.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 02 Sep 2026 01:47:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788338865; cv=none;
        d=google.com; s=arc-20260327;
        b=IY3LnFA3oPJ8+giACytvrRU5mSwIeUsoaMVrlMHkIOVme6lT2wuNI4q8XGGulNJja+
         0YTzCWnVLIPc5nqcGkLhQm5WNrs0mIkpLTCtmJv07IoUYPfHHP9nOIvp5O7COZhlY3JX
         OiKPoXUtHDi6MnBqWUxMjoutidrwkPMFVhTMq4dAaglXG0/50QE4cHB8c4RxV8V1yKh7
         3QlMOKoQ28MoX9/vXkH9gLsBSeSibY18KdWexpSv3Ap3m0w2CNho/0DRGs7vdMl73OHK
         Pn9SqfITk34yZxufu2BysqSkbuAlmXVrRXS+3T11gtEEvS97wnV3wrc28foI+F6Yevlb
         RDMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MYMnfWqyZs8fhoupAqZEoP21jVypdUTvrAIwa7LBw+w=;
        fh=qp9zvjwP9AiX68ta9TMtiLbJz8tMK7t3RPhXCq3dr9s=;
        b=efnQbOwFRGNpRKVCjY7LNyTVdpai8TwJy6SasfzZU5bR58FGtrSEGcuYGWS6DAaXB0
         5goDW6udWbsOA2hv+YN6fJkiHP1X8hi0wZ3uJNjzNLzk5EDLFxUSxgb25j05qNPL7Ean
         CF9G4fyWcqN5o5lmjuFrsAskf4B19sFiWui0bbON8og4ue47v6NipTh9Tht+8jBg0o5Z
         jQwhFaOSrQsdejytQJbPuyM37B+2AfFvXRkh6m7JAM7Bk9b8ISrntF2fojcAnLZZv5wY
         gEMVRH1DCCuhWsN/Ay1TNtjphLzvY9lPTuuBTuSn4+lzH5YGe2zKTnWLg9GpNSf3CDTC
         zBuw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788338865; x=1788943665; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MYMnfWqyZs8fhoupAqZEoP21jVypdUTvrAIwa7LBw+w=;
        b=JTdVNV21g2YWyfe6GhHZDvldy2EdW34Au/wroMVXg5/ZaYPu0fHVKxjJs4EoTz4wVi
         KTLST7CdSaFpOlQZdN/gHRSeNn1foi3o9kfjl4fb3E7mDwShpsWC6bGryTPFtyaV3T18
         kXEwa2vLY0YowMeRxlejjE7HQGfhK1HkXCTPco+soVfJOHFXRO6V+0qL20bwiBM9vjUp
         NDUjuyEgM4/j4LeVX1TRAGjktFiTNWftB2l+XPioBVxYIWF7JF0E6ATcRttOfYRV80CM
         6mErKduuimdxrcGOeI/Bu9Jp3PwN61HsLr1Nc/g+TWsrSgIuzlomtsp0uHGx/F+BfMD2
         hmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338865; x=1788943665;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MYMnfWqyZs8fhoupAqZEoP21jVypdUTvrAIwa7LBw+w=;
        b=Grn7MqzAA9z73i2LcqCR4ir9fiYckOhHwiYqZ/rwOASUZqK93KIdp/A/7qy1rJ6hJF
         curSOeFT2M4QMUM+kRIHrZbIuDu1LAjXOx0ibW6ydTd5OnWY5/36Doe7sjnGsD8yTa0N
         J6nWME7TFHpt5zixbzo0XB7ANDLxPG2PgJR07kuujYYzwrxB6pupLcbS68844PKapqzw
         qy6PBPwVgmhw1SS75PPWcyDG3s2kq1d3oVhneBw3uWKASZ6fWEf887uXj7nfPvwkvCbk
         EFq+YNmR9iMioWd1SpsOGXp94ufzftwMgn0X6oFWnstmZ8Q3BXpeCpF1j9mp9tKi+O8F
         GRPA==
X-Gm-Message-State: AFuF++nNC8gUv/UdoZhyYS79+Qyr5kb5s02ZEhDkNcpa44JMd4Els/sF
	HiNQnnRDdv6YfFT357wjTuW4E0acNhUQxzPUHRxIU85vZpmN2TxbxNoxTqBjHAay8ZAxFxjaVcA
	qAvTEnle8LipNDDAAXgGG6ieNi4TW/1vdzJJt
X-Gm-Gg: AR+sD12H1W/hBKd7SSki1CTp2bv8cqhgMc8DUckrjHWIBUWUXbR3DfJk8JQ4YBDD/Ps
	Xbj7H9I8U95UZZCw24WlqK3cnJJNS2+Oaj1HMX+bi/JCUMAie1Bgux1uBRBXtXJUgM/uNo+nJ75
	6WbLeHbs9XwztEGQJEIexMiNPNNtBaJHtgbkJV9tOCfV97dhpnI4PaD3zqKj74LzuZYH8Xa0811
	XYj7G3awiTeIM+Te/cb7stzvnqq9hmiL1ulQtOpPpr4Iy3CCuooi3x27oGxEj75T1N2RgzBbk5W
	0XOB6luh+U9bNB0cPZaZ4VPro+musRcFf7eKZh+YaLPL4dMsWnh34wxO3Fbj4zvFKIRvFYMj29K
	asQ==
X-Received: by 2002:a05:6820:189a:b0:6b3:68a9:79e5 with SMTP id
 006d021491bc7-6b47edceea1mr2290029eaf.6.1788338865560; Wed, 02 Sep 2026
 01:47:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260823111959.17029-1-amit.barzilai22@gmail.com>
 <20260823111959.17029-7-amit.barzilai22@gmail.com> <20260823113402.D7F9F1F000E9@smtp.kernel.org>
In-Reply-To: <20260823113402.D7F9F1F000E9@smtp.kernel.org>
From: Amit Barzilai <amit.barzilai22@gmail.com>
Date: Wed, 2 Sep 2026 11:47:33 +0300
X-Gm-Features: AcwNN1Vo44MBmJfOcBB8zzBfrsBJUHYQroJ08viZBYwnFe3YB46ZksIwW3AFHfo
Message-ID: <CAOEgbEqhvoz-J0o08_igTAJdfEHN6vZcxgd72An=BKO2L2jhOQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] drm/ssd130x: Add SSD135X_FAMILY and SSD1351 support
To: sashiko-reviews@lists.linux.dev, 
	Javier Martinez Canillas <javierm@redhat.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2026 at 2:34=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> [Severity: High]
> Will this cause a DMA fault on stack memory? Callers like ssd130x_write_c=
md()
> allocate the command array on the kernel stack (e.g. u8 buf[8]). Passing
> cmd + 1 to ssd130x_write_data() results in a regmap_bulk_write(). On SPI
> devices, this passes the buffer directly to the SPI DMA engine. Because
> vmalloc-backed kernel stacks forbid DMA, this might cause an immediate
> kernel panic or fault during device probe and runtime updates.

This looks like a false positive. regmap_bulk_write() does not pass the cal=
ler's
buffer to the bus. Since the map has a bus and val_bits is 8,
map->format.parse_inplace is non-NULL, so regmap_bulk_write() takes the
branch that kmemdup()s the data into a slab-allocated buffer and passes tha=
t
to regmap_raw_write(). Slab memory is DMA-safe, and the caller's buffer is
only ever read via memcpy(). The finding would be valid if the driver calle=
d
regmap_raw_write() or regmap_noinc_write() directly, since those can hand
the pointer straight to bus->gather_write() and into spi_transfer.tx_buf,
but it doesn't.
