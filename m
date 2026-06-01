Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B1A388E5B
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 08:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780301387; cv=none; b=j5OWSTxbcNuLNutEjyiHNA9lglHDKzTVOfNnjTD/LMLfluKN0FzhZhbVPrV+yFrUnvKlXEFqpjBephFv0AEa8mVLOaoj5WjQosTBWqhqWDmJJVsU8UGjOqrx62Dd7jk+IuslTjNB2vN6qLvzIm118q9R4Q87aAU9qlijVsCQwS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780301387; c=relaxed/simple;
	bh=/gF4meNxP3tZd7bAVd9ynE3Nae3TsywwTPfmtSKlIho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J3u/TlASJ4J7oxEFUmQIOHoIzXc03jWBxqVYEBeljnmNXtzIulImwrCLdgwJy2Jgl43kFDRvIQGFGxYLWVgsk2GsDR68u33vrLSi1V5QnWbfZYA3EDL0Pj2rDNxqgQUm7oyMIr1W2cmCouhHhpnNQVcma0P87cr+0S6O9+qcPFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QUodbKsa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QUodbKsa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F231F00898
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 08:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780301386;
	bh=ZqSwAQlD8oM7EAZmvH7V6mlqg4Gz6sLRYvv8xidwzlY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QUodbKsaCkSw3QMRkLSoadkN8hH4YOLzK8lVUnBPdViAD9Yz4kNF9GDQ69xk6zkKv
	 Xf5Uz6+B5Bap5NgRpzKX7s35zga+u896VPEOS77hOkSf7eK3fguv+ilkeec00Mpk0e
	 PGLQnv7oImNll3DjRgvMz65vIaJx0GJt/iRr26J+826ETnTEDGs1STRhCINA0E0QDH
	 pF+QRDBMWNr82b2hhVMmWa/REJjWym5oVXMbKh+yDdjz2Zbqj2SAkRmWAtCYScskOe
	 w6XDAWUdBtz1CJuw6Ydxw3NJnI5I1jthmIqGZEVlx54j9PoJcV43+TRVrqABARVd8R
	 0uo0lRYSDmA1A==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa612bf6efso1828512e87.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 01:09:46 -0700 (PDT)
X-Gm-Message-State: AOJu0YyiDx9DjOHowp1x1hulv00noFdA/ij+pwNaqI7z1WnRuy7Rti2V
	LhoUDjdc31BeURxBxoxjG7yTNcKa1B84I7bktlFQ65qB+6abbs88fmwNYodN2uxSPdDYvwRDqwu
	hU7Cl7Csjx+dWa3huRleux0mkGwbIvU4=
X-Received: by 2002:a05:6512:6181:b0:5aa:6395:9a00 with SMTP id
 2adb3069b0e04-5aa63959b8cmr2096101e87.45.1780301385240; Mon, 01 Jun 2026
 01:09:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526-ks8995-to-ksz8-v3-5-c530f651989f@kernel.org> <20260530004902.BCC381F00898@smtp.kernel.org>
In-Reply-To: <20260530004902.BCC381F00898@smtp.kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 1 Jun 2026 10:09:33 +0200
X-Gmail-Original-Message-ID: <CAD++jLmZoGh+o5YKfjoUCWhwiRaO+Lm-9DFUdUzd9KpydWK27g@mail.gmail.com>
X-Gm-Features: AVHnY4I-Fce43HRszqsDnice1JnVb6cU0myB4eNuyBJaUrbAvABJ0FTEkMAMTyY
Message-ID: <CAD++jLmZoGh+o5YKfjoUCWhwiRaO+Lm-9DFUdUzd9KpydWK27g@mail.gmail.com>
Subject: Re: [PATCH net-next v3 5/5] net: dsa: ks8995: Delete surplus driver
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2026 at 2:49=E2=80=AFAM <sashiko-bot@kernel.org> wrote:

> - [Medium] Silent loss of switch driver functionality on kernel upgrade d=
ue to missing Kconfig migration.

No-one cares.

> Pre-existing issues:
> - [High] The replacement driver (ksz_spi) fails to probe for devices inst=
antiated via platform data (non-DT) because it lacks driver_data in its spi=
_device_id table.

There are no upstream consumers of the platforms data registration path.
This is easy to verify. We don't care about outoftree users of ages
old drivers.

> - [High] The replacement driver fails to explicitly enable the Port 5 PHY=
 mode, a required initialization step performed by the old driver.

No it does not. It has a special callback for the CPU port and it works
like a charm.

> - [High] The MTU limit logic in ksz8863_change_mtu is completely inverted=
 for packet sizes between 1523 and 1536 bytes, causing hardware packet drop=
s.

No. You are misreading the code.

#define KSZ8863_HUGE_PACKET_SIZE        1916
#define KSZ8863_NORMAL_PACKET_SIZE      1536
#define KSZ8_LEGAL_PACKET_SIZE          1518
#define KSZ8995XA_LEGAL_PACKET_SIZE     1522

static int ksz8863_change_mtu(struct ksz_device *dev, int frame_size)
{
        u8 ctrl2 =3D 0;
        unsigned int legalsz;

        if (ksz_is_ksz8995xa(dev))
                legalsz =3D KSZ8995XA_LEGAL_PACKET_SIZE;
        else
                legalsz =3D KSZ8_LEGAL_PACKET_SIZE;

        if (frame_size <=3D legalsz)
                ctrl2 |=3D KSZ8863_LEGAL_PACKET_ENABLE;

^ If this is cleared, it enables packets larger than normal size.

        else if (frame_size > KSZ8863_NORMAL_PACKET_SIZE)
                ctrl2 |=3D KSZ8863_HUGE_PACKET_ENABLE;


^ This additionally enables packets larger than legal size (jumbo frames)


        return ksz_rmw8(dev, REG_SW_CTRL_2, KSZ8863_LEGAL_PACKET_ENABLE |
                        KSZ8863_HUGE_PACKET_ENABLE, ctrl2);
}


Linus Walleij
