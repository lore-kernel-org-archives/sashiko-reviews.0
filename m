Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9024631A572
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 22:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782340903; cv=pass; b=lOGerj9onakt1bo91kX5qfzIo4q6ai35MZqAMoSlNcEQ1Wj+MuMJ+IfyIz2XHimhFPUIgor0jBlwEAwPlpDnbPWzrRw0wBw9jJjwZJfhWyTKe6HejabAgPfUtLeivnLl15bEhoRrqGRqnDpnDoe1gTfu83xQTpkkS+/asmB0tKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782340903; c=relaxed/simple;
	bh=lGJ2gfHSnw57MpbofjpuTPtD42d8yiISwF4In2IuKDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BZ65S4Fl/5UVkRp/mYrAQc4rw68FqIq9tvaJKlt3+3o32Mw4+Yyh1zLz2jjr2dK9i3iI3+y/OnSD2ifEkrreCcU/IH1Xdf2svcOH0E/U4eNgmq/GThhHkqA8CVghuAyx2QQGsfiMQE25cgElcSWmjIvrBsdYXY2Ueqhqm3ObXQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GuN11l4Z; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GuN11l4Z"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-662d484ff3bso1612906d50.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 15:41:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782340900; cv=none;
        d=google.com; s=arc-20240605;
        b=XMXeLbNH5sG+wVKhnG6xQk3BbO3W++oUgjHuSp317sPfpqxJbGimh0CXwaqyjUeewc
         WU1uJk65shwUdl5vhCXBIynlwdc+39CPaeJjp5DakCp+CXC//uLdDvhkoH7RMGCQ3dxd
         fZBQSJDf3yHghRUGLAbPo3OHjbhLlH/j6xrx9P9tF3wTM5ojOMq+Jts8/YwLtb4E8Fxm
         mzAy1WYhQ2l6dbZQnQboqatDVxh6eUAFBX+l3SWaVkjHFgLESM+RfFP2ybmXdX7hlkzH
         WTCLKvOMUty3EqqScuesDCeLPoDMdBvcgErx7z02ELBFjRTdIOJ8jfg9x+Wkm4+QOv7G
         Cbmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y1uYuwI5UQMrf4FOORVNSBAqq2rAsy2aYavTdYoUa1c=;
        fh=N47MUBkmNywxHSo9ss1k+sO8bLxvsbbVY+II0SarRNU=;
        b=iqi/FCXFq2HF+qemieuuytwUqyAqeEJqrGN2wq00B6UL5hm2Mq29OdkzrfVIxDQTVW
         o0aqJjL1eQYOz2yWsVz2y1GLHbuTTDergDIezGQyPz6cusfY8BbcRyRhhzTW6MRNooho
         SXkTEA6hRWVwjSGDaGbA1LiaP0KXcQW+OSGtov7MpoMZakrfe7lzHmvd8u+19EcEmY2k
         F34HYD9qYF9ssYnH6pHSU3Lt9pLavOWMkYYSa/E47usgXUqftTljTN3Sga0Br8czTX3C
         lCqHyaa/weLAuXgZLSTApJQzqmnBnj9RvXclUKdg0TQlN+UBbBabfZXyC87Em+vdvYXd
         L07w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782340900; x=1782945700; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1uYuwI5UQMrf4FOORVNSBAqq2rAsy2aYavTdYoUa1c=;
        b=GuN11l4ZthJWQD1diNXzPqfqssFynnc+CdJQcueIQelcN1SZGVDMNvZsXBeAobrc/k
         dFS11IJDiCtVR0Tcw1MsWfnCM/PwgDpHCSZg6DKDpf7MBF0aXklBLhLgoZ9flj0QkXgi
         AWEyTOISuxiHBRyY/9oCsJtJBOMxVbFw7ZrCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782340900; x=1782945700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y1uYuwI5UQMrf4FOORVNSBAqq2rAsy2aYavTdYoUa1c=;
        b=nPVNsA6egWob9qaYaSCuEtgLueq782i6OQAX4kLGrWTMuUroh7hRCiOSAfQrcDM8Yi
         t0WBb/2uFpJNyPo6GpTgd6MejlMgQq378EhnAmA5pyDC+UQV78JXqt9JRBU5o8FA8bJu
         YZbut05pOReGo8J0lmGIyYj71b4r02/BdMtL/6ItLV0s9iljCoIZFSKL5ZwQN/Zdi/Fo
         FUXCblhedE4rxueYIB/JgLAOPBcH0BNEwOK5d9iZ1KuGQLJTFLgB1VnkBftnIytdSNNI
         I+Kx/G2EBhYcQ8DYEtVPG+uFAFapo7hhpGQTRk7u7r9gb3CAiaRNVhXOR9JGjj9lbrPj
         Pr/A==
X-Gm-Message-State: AOJu0YwjOdkqnWY/BarZsJqsQIMPcU/7xLV8vpnDlaAw7io65MaaFXwk
	zLCTUvMzZp3AR6TxfEMS7vghh97ovSl7qnXR1gLIsyJ5ZRkX9Gbj9n7Ab17laxQTUuM4268sBBb
	3MZHnh+94OkVHkcfB5YXWj0tzM0fZP3X2Ae5vWg8Gwn3eNzZV5rm2WK0L
X-Gm-Gg: AfdE7cme8NNol7EsEdFssqiw3VDK/NWrGjTbgihR21Z/jHfj7Z1+GH2DMe+4WclTDD1
	lQxok4jcmuzvnjF2Lbx6d0JFqI2JdL/dUvYpnwmOqwOSy6/ASalgZxXiERpR6BuQF4B2Lx0rPvg
	gRIHGtlGQcsLMZtUejRl2iAuxpjRo+i+nUL7NzwQ63eicIGoFEnZ5JmDH5EPiNqSgjiyuMU5u62
	7G5tLYEvNupMve5pYae4cAcHGhtEErGDGcWm5t56ccRaIDjRADR/jtI5LCA1nXkkbjaO+lwBPp2
	DjzfFgka+aWGZ2uLW3HSRrVUMQ==
X-Received: by 2002:a05:690e:13c6:b0:65d:7d86:7758 with SMTP id
 956f58d0204a3-6636e4fd15dmr4910430d50.59.1782340900600; Wed, 24 Jun 2026
 15:41:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260609-send-upstream-v4-3-b843d5e6ced3@chromium.org> <20260609045604.44FE71F00893@smtp.kernel.org>
In-Reply-To: <20260609045604.44FE71F00893@smtp.kernel.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Wed, 24 Jun 2026 15:41:29 -0700
X-Gm-Features: AVVi8CcTKZzbbZlWyreRB8uD4ucjtFXbjur0kDwQgo7E4rh-_3tMMR2pon7swuI
Message-ID: <CAEe3GZFVuy_Y-qHtXtdiZkoQk3vK357ZnJO2A_1WroQASSbs8g@mail.gmail.com>
Subject: Re: [PATCH v4 03/11] HID: spi-hid: add transport driver skeleton for
 HID over SPI bus
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 9:56=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Embedded arrays `read_approval_header` and `read_approval_body` =
are used for SPI DMA transfers without cacheline alignment, risking memory =
corruption.
> - [Medium] Unchecked return values of reset operations in `spi_hid_dev_in=
it` and `spi_hid_resume`
> --
>
> commit ea35a3a23739acaca367a8d250ef25c96d22df36
> Author: Angela Czubak <acz@semihalf.com>
>
> HID: spi-hid: add transport driver skeleton for HID over SPI bus
>
> Create spi-hid folder and add Kconfig and Makefile for spi-hid driver.
> Add basic device structure, definitions, and probe/remove functions.
>
> > diff --git a/drivers/hid/spi-hid/spi-hid-core.c b/drivers/hid/spi-hid/s=
pi-hid-core.c
> > new file mode 100644
> > index 0000000000000..02a7608c4b882
> > --- /dev/null
> > +++ b/drivers/hid/spi-hid/spi-hid-core.c
> > @@ -0,0 +1,213 @@
>
> [ ... ]
>
> > +/* Driver context */
> > +struct spi_hid {
> > +     struct spi_device       *spi;   /* spi device. */
> > +     struct hid_device       *hid;   /* pointer to corresponding HID d=
ev. */
> > +
> > +     struct spihid_ops       *ops;
> > +     struct spi_hid_conf     *conf;
> > +
> > +     enum hidspi_power_state power_state;
> > +
> > +     u32 regulator_error_count;
> > +     int regulator_last_error;
> > +     u32 bus_error_count;
> > +     int bus_last_error;
> > +     u32 dir_count;  /* device initiated reset count. */
> > +};
>
> [Severity: High]
> Does embedding the read_approval_header and read_approval_body arrays dir=
ectly
> in this struct for SPI DMA transfers risk memory corruption?
>
> When these buffers are passed as tx_buf to spi_sync() (e.g. in
> spi_hid_input_sync()), they lack the ____cacheline_aligned directive. On
> architectures with non-coherent DMA, cache maintenance operations could
> encompass adjacent struct members.
>
> Concurrent CPU writes to those adjacent members during the DMA mapping wi=
ndow
> will be destroyed, leading to memory corruption.
>
> Should these buffers be cacheline aligned, or dynamically allocated?

read_approval_header and read_approval_body arrays are not in this patch.

>
> [ ... ]
>
> > +int spi_hid_core_probe(struct spi_device *spi, struct spihid_ops *ops,
> > +                    struct spi_hid_conf *conf)
> > +{
>
> [ ... ]
>
> > +     /*
> > +      * At the end of probe we initialize the device:
> > +      *   0) assert reset, bias the interrupt line
> > +      *   1) sleep minimal reset delay
> > +      *   2) request IRQ
> > +      *   3) power up the device
> > +      *   4) deassert reset (high)
> > +      * After this we expect an IRQ with a reset response.
> > +      */
> > +
> > +     shid->ops->assert_reset(shid->ops);
> > +
> > +     shid->ops->sleep_minimal_reset_delay(shid->ops);
>
> [ ... ]
>
> > +     error =3D shid->ops->power_up(shid->ops);
> > +     if (error) {
> > +             dev_err(dev, "%s: could not power up\n", __func__);
> > +             return error;
> > +     }
> > +
> > +     shid->ops->deassert_reset(shid->ops);
>
> [Severity: Medium]
> Can hardware reset failures be masked here?
>
> The assert_reset and deassert_reset callbacks return integer error codes.
> However, their return values are ignored in spi_hid_core_probe() (as well=
 as
> resume paths).
>
> If deassert_reset() fails, the device may remain in reset, causing the dr=
iver
> to hang waiting for a reset response IRQ that will never arrive.
>
> Should these return values be checked and handled?
>
> > +
> > +     dev_dbg(dev, "%s: d3 -> %s\n", __func__,
> > +             spi_hid_power_mode_string(shid->power_state));
> > +
> > +     return 0;
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-send-ups=
tream-v4-0-b843d5e6ced3@chromium.org?part=3D3
