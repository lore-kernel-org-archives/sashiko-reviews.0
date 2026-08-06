Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB47423EB4
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 09:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786007199; cv=pass; b=C2LCT1+Osw7ICkujUzKOwpWLZfyhenhFmAmYrfuhrqDyKMV6KU2rX/dT1PzVYtxsCPVQ4+i0kQ+gqgmhCLbD0aUxmZCGlhuxmVfoBjhTRHOjXwDSO8adXKJE2cB6FdBHMJLcuAmCPfB9ZbxiRbMcG2G4XQ8BC6xUaZFDE1p8O+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786007199; c=relaxed/simple;
	bh=7crgwx/ciSJ3YxNEg04ALNNE/ZCRr2ZUG8UeoFiokmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nvbOWOrG4iHUs0aWBVtcc6MGxRzUZ+RDSm+Kk8nJeVvBWJ9XXoCECKyJhxndAHjJFMYX5gOUR4zDrS5a72bOU9J6esEnI8zyXfGf4PTqm5WwHNerzHm77e9Qf/bZYaZlxlUn+M6P291vGHWhVB3SG3Mr83Ab2w5SUxSDuzzVyRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGaaNdUC; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGaaNdUC"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c1f5208b38dso351553866b.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 06 Aug 2026 02:06:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786007195; cv=none;
        d=google.com; s=arc-20260327;
        b=Ddbk15GTnrE1KodXvyPs1lbZOUCJjpfcNXl2flOt5fzrN3yPKGKN6QWW71CK05ImLL
         WKI1cqDQJuHinkb0ReMZjqRdpxdjKC/iU6Rvi1KkbhTSOZw4nVdhPtB7lX6Jr3mcuo0f
         x1xYmh8Yoh9yOPwUW55s3vOJEW2np4fGsomf8vbr+vIODklTEFrFBx/Frx7FpWNaK8pH
         zxVLyRhpUTyFTJJAAUZHZVr/huG27dSCp3ekybGX+pFt6+qXQfY6RsO4NR5D2Z3IEiR4
         XPAsKS8cl0PPEwjASDX9QdOtzFB4T102HJr9pJASH56D1makGRR/HsWgjdfiU8QXOb/T
         QQDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7crgwx/ciSJ3YxNEg04ALNNE/ZCRr2ZUG8UeoFiokmY=;
        fh=53qvJawqK0TJTsq+MaD47KBMEtgXQmC582XHmZ7TrbI=;
        b=gBeovJvYPFsFONAgGT6QGZygin50Zw2b1qUlnCChPgxBYFsw7lUIGj02jWHmbcj94p
         VF6cPaK/YlEOwXUEHIimjRD4hxfyJg36l/V7fSjy7MVUaozMbjkBCJ5Hot21HJ9rjPzJ
         zjX1vRZao/Id80/+idv09XXjux/64pVX475lUZIkIavcuwyV4GtfssotTYc+K623r5HT
         WC1fdhbOKe1ULH6yL//+TV8fhQmntVTUneB6HxOU5Kuu4LUaLsem7awh84TA3GfdvN+F
         Xq3pQpPTI4+BQhjvneFk71KI6icdTDsOODUpX57F4Hkc+R7BYIEEwe5PF6lQAtVmL7hh
         JzTw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786007195; x=1786611995; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7crgwx/ciSJ3YxNEg04ALNNE/ZCRr2ZUG8UeoFiokmY=;
        b=lGaaNdUC9psq0lFtD/sw0nNqOsVGxX5fRC1c4GFKwUbGuGATvLI/voG72WHlKTLF8/
         sFWnhZAeec2gbTc4JKW07aobLxIC5mhwz/D/oPdHBbCcnkfTAMRncMsDzAUGXgdRHbUE
         i/2Y89Cjqv4AIPpK+YJbpfKfLMSzOG2sEE423ZhYjBCb28TWBmU+2cYt2yp8sQqwkjKY
         nFsMX99R/ZEKHVISd5NgWZxI857x3Tj6QFWZGzSZVQVcgnGimjHRPkK/3lrAAp8xd9Lc
         yV5XSa678fYbr6Pz1B4r9dgf7Qg1MkjnyLOXTloKpgg8QlXhU3BHzw8K8QUI2S8PCIE4
         Iq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786007195; x=1786611995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7crgwx/ciSJ3YxNEg04ALNNE/ZCRr2ZUG8UeoFiokmY=;
        b=G4Gi1A4leyOo/BNKN4m0/k2eurXKY5C8CDBu3cjxMS/5DYorFS8WbTCLu8nPPIhU1D
         +QJqAAI4Ehr1C7Q9DgAOoNM9ZhAGlrQYVy+cGmOhF4YzqGXl9UCtbQirVntCtsoX0040
         jp2t+w9V20ES99IdxnPhBm9F51FTQ0Adq4tV6G4asAPOmce/Nex8cvXP+bJI6cI+6f3w
         sxbLN7SmGIZxjdY37GCqalF+cNXitZAsM6iJM5Tz8DSxbTB/ItfPjyJ5SRwCfV6v5Qbh
         bvJnOkfJnNYfLg7De70yS4x3FDKHtQMTyry3Vf31DcEbOWMv53v8hic1oztvYwabFXzy
         Th8A==
X-Gm-Message-State: AOJu0Yy04MXhyTbcr0jjuwOoxn2QJNnIgyeu1mcmi3/LlF2S2R7Eyn6E
	kXLUhaJXbFSOdJQqaXidYmJzfzT3WL0GekXgIfcpZL6CyXA9lWBAKpge9c+Eldju9dCe05YZT/+
	xafxKwf84CUY8ctIZfZQl9piciZG+UWYoz+GN
X-Gm-Gg: AR+sD129MRNFO6dj+fHUbCmqH5ZorPJqjj92RJ88GJB19yyq2MC88uP7BYh0IhGsZOc
	qcSmRensPRavQnXw4nZygH2ZfT0kKBz0Cvs0QJtB1uOsW4IOPoePKcdZB9COh7zZr+j3PPtAI1x
	MXg9n+YQlutxi2EEAUnQuQB2LfvyM2X7YRZ5LyfnFsz5atQGayiT2KWLgZGqgj3AbIvwDsMDDWZ
	VfU+n+NBTcTCGnzqI6oBuwSZAW5Ic3qOLY2D73GDXhXxjjrn9n2M7sk8XWLAKoLAR8gZGLWBHjk
	Jj7wxKctCuMO27gJS1mYgrrpQrM75VYgxIg2xjX8uaRfPA==
X-Received: by 2002:a17:907:1b24:b0:c12:8b1c:454f with SMTP id
 a640c23a62f3a-c2039c0264bmr718944366b.2.1786007194846; Thu, 06 Aug 2026
 02:06:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260805085540.452260-1-a.shimko.dev@gmail.com>
 <20260805085540.452260-4-a.shimko.dev@gmail.com> <20260806085705.319D61F00A3A@smtp.kernel.org>
In-Reply-To: <20260806085705.319D61F00A3A@smtp.kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Thu, 6 Aug 2026 12:06:24 +0300
X-Gm-Features: AUfX_mywS_-Ap5-a--PJds67KA2ZnUqnVz73jHQni1dDTkW7W1PRCoPmEm1NfiU
Message-ID: <CAOPX745QvyfneEwr4aHCCF6xqYzfH5UTDg0LyBWTC13vVro9qw@mail.gmail.com>
Subject: Re: [PATCH net-next v6 3/3] net: phy: add DAPU Telecom DAP8211R(I)
 Gigabit Ethernet PHY driver
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 11:57=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> Should dap8211r_modify_ext() for DAP8211R_RGMII_CON be called before
> triggering DAP8211R_PHY_SW_RST so the PHY latches the new delay values?

This was already discussed. The reset is active low
and self-clearing; RGMII configuration is written after the reset
completes, which is the correct sequence. Verified on hardware many times.

--
Best regards,
Artem
