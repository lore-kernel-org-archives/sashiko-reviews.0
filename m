Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66E9411FBF
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 12:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786970864; cv=none; b=to85mMtS/qTR/Fu6cQcBAQGxq8fXvl4tRMooWzBrB6f+AbqYW/UszFgjrfs8oAA1s2n1BEruD6ODXXic1Z5x91WC9MhSEWhQHQn+6s8nOEnYqdDBn6WXchPSAVPaQwFw1qsgkd+vNfkioTu+IA7zznD0Dn65MznErj9tWum69b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786970864; c=relaxed/simple;
	bh=s2rtvtJ2Zs9ODTrVmfKyg1A8xTc7f0ak9hMBiy4pt9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ev8EFNabfNax1ZYXlxjeB6SwxB6irZsUSH4RneMeBmB6xbhL2gRC16yMWrZptUrkmp45i07dmVd7xeFouiCg+XtvwRJAOWgAUrrCpwNbrFVf5FW4JAUQnExTGXCWuQyqK9vlhzlHddiVo7+IWqsWEg/AghQ//7nrdrZ+WuQNplI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BiZSDBoq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BiZSDBoq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D979A1F00ADB
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 12:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786970859;
	bh=s2rtvtJ2Zs9ODTrVmfKyg1A8xTc7f0ak9hMBiy4pt9c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BiZSDBoqm50354ZHKghBlcI8JMQ2hn3R6ga801/4k0I3WDxbUeVeAHZwMEofi5Xuh
	 5h/Q3jmQwqcpEAD6BD5OIItDrKhJ1Q6DmiZf47P/7vLgoUhv0wcz8mzUVR5hBIQVwO
	 ub61g8dBLBiGJEFxgQc5KvL7f32lJfRAnIU8pKlhGF+kIL6XfYji+x7Ji/jHLJwIH1
	 kbSujBQvmS1TiR3ZehEbj/DO811uih6cTFK+JdTRn/Mury2107xwu+yCmzcfssf3qv
	 9Auja6/u8fRKziSOY9a2gjEyPuHP18z/BOt5zAYBvR9HU69Ja0cA2FrgElTgVz5nQJ
	 qadraS1M6p2bQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aeb59d54b1so3365964e87.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 05:47:39 -0700 (PDT)
X-Gm-Message-State: AOJu0YysA/DsK033fj3av3dI6YUoHYKG4maM+A5AlUNodXqCMC+4Qpla
	h78FwhLCo5+HVFzzNwhUNq8TZmWET97Hc2Zm1Th9RxWGdbCMP6nwKz8SJWjrGeeMhBY0rWDqxvO
	ClLS0lMRQTqDUGBfJf8aihGMXdtuTWkM=
X-Received: by 2002:a05:6512:3c8e:b0:5b2:a339:b3fe with SMTP id
 2adb3069b0e04-5b459142a64mr4331005e87.39.1786970858605; Mon, 17 Aug 2026
 05:47:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260814-cv75-v4-b-v4-0-ef2e83ec0eac@ambarella.com>
 <20260814-cv75-v4-b-v4-3-ef2e83ec0eac@ambarella.com> <20260814063535.C6FDC1F000E9@smtp.kernel.org>
In-Reply-To: <20260814063535.C6FDC1F000E9@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 17 Aug 2026 14:47:25 +0200
X-Gmail-Original-Message-ID: <CAD++jL=i=3CoEmzna=TQ5PK_SzvpEQvCd2kfH-LQyiX_JOjp-Q@mail.gmail.com>
X-Gm-Features: AcwNN1Ub3MluVCSOtBXCMVwsBr9zE_eh0QVKAIufPV1Seikt9XJrXsHt6q9kkN0
Message-ID: <CAD++jL=i=3CoEmzna=TQ5PK_SzvpEQvCd2kfH-LQyiX_JOjp-Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] gpio: pl061: add Ambarella CV75 register layout variant
To: sashiko-reviews@lists.linux.dev
Cc: Long Zhao <longzhao@ambarella.com>, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 8:35=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Global replacement of strictly ordered MMIO accessors with relax=
ed variants strips required memory barriers, risking device synchronization=
 and IRQ storms.

I think this can be safely ignored.

> - [High] Unconditional clearing of the Alternate Function Select (`afsel`=
) register in probe forces all pins to GPIO mode, breaking bootloader-confi=
gured peripherals.

You might want to look into this.

Yours,
Linus Walleij
