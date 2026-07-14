Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C015A466B7B
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 13:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784036001; cv=pass; b=Pd8OI790g40ng+CWeyJt07srBhlDDCitXJNnxl/zpb0xV4dt9OCAqglNlHqiuUXgLXFMof7Ac3Sd/V0Jlz+I2/zsMMKkjKWcdlD3O/zDCfevTiWGP8SeRDZTEf+esP112snMF5TCpxOxg8pOA7D/mHdKzMHeI4aii0bJNfo7TGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784036001; c=relaxed/simple;
	bh=tFXARX4SHAk3PI59oKiV3+pkOUhhlBx2uKmJFHAo6l8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lU/j7gn5bawe4wDJZ+g+UGiBQd9J9y579f1S8ir0jZl70eIogSOmLmg3jzDuH2pkjnizQp7LgAGk+6lwr4GD9GPrAq+mPuRg7Yqurdt3LaePQKmkYWQmQVqxSu+unZXF9Uh/5Kq2fCTgsH6IuWXWAGT+PgaS+Kqem6f1fiJ+M68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQLAr/NA; arc=pass smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQLAr/NA"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7370ea43b9cso626034137.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 06:33:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784035998; cv=none;
        d=google.com; s=arc-20260327;
        b=Ky48l4F6ZAJkioMkJ0l+S/54yBe7ZG/DYmCEB7SXNBtnAlrwzTUwtm2RuY1O+RXfUU
         BNvVXN2lCxDMMvexq+cmYS00dNHeeDsIpHl6IP2TiXSRQuQf21ADoT+1iDLBX5T192FK
         OndLdqDMqcT7e5ZnBAkd9aBH7Aem5Ogu5Hsm/XSjFRDkfexlCRd/nSZdXm83JhpMLeJ4
         UzOtap0kzEZ+nBG+CJ15a5ka/N3aGHVE072yJ2VB6TmDGto9UA1/N58HYnACFTJ0EuSJ
         yvu7KwSc4d+sRz+JbUelOekC5LP1BBDULODCMhEq1mmX1eSckbmY0NNLWQaeWXLPCeZE
         OChQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tFXARX4SHAk3PI59oKiV3+pkOUhhlBx2uKmJFHAo6l8=;
        fh=dfvPRi+t5KvUF1qpgNVmacxvd83mvku6fE8K+/2kbH8=;
        b=VC8iFjn8koTfH2/inPAnNFqFcH8gAme0S2YyGqdkKqltbbgSjK8kZfR78p/jpVbxHT
         ggtHmOgVpSIRXTiso9qjccezi7NWXdRPQoCtP6aE4iVUBf2aAtmkgzGe1PALn+kQqJE+
         Lbxr35DScVPY/4oyqGRwyAXS3wllLgr4xkJ8uW2gyGIGpeF6GR3uIb4ObPAYx+3iPHkM
         H5r/7b0T7NxCNnmT/YSDk8Z1s3PbJWMvvi5QFT/WprFO5KkaFYRGdzKMHzwJeJXDaWAN
         nour32WYsekKLRTTxtkHHqOud3zhKDuVIjpCuQj9qksVYaCV6iBXYYzeJIi/svrHQotE
         w9JQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784035998; x=1784640798; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tFXARX4SHAk3PI59oKiV3+pkOUhhlBx2uKmJFHAo6l8=;
        b=nQLAr/NA1ZzTvvF4/0SyzfLdpLzBP9lurD1yaKbNvodrrx4/dys0v/3hGwXDP7Z3Qw
         tbloTOKYTI5uZr7FcRcnZ2m26wQ+FYlZE7DvEctPPNkA11/Mw+6Xay7R0focR7TSJ4ta
         5qXDjXmsNSpuDPg16fPzwYnKa+9HJU5o9xssdXq5ZkjNnRPDUuMq+oE7mRUkluVX+9Y9
         4aQ2rYVScSO/nA7JUrodYDg9xTW/M0MROZPEdu6BEeIBNpsfEI1FvBCVnlOiLFiBny6+
         HMyoNHL+pF5BU9Al9fGM/eXlS22/o6I8BHrXVQD5TfeIzOI/HQ0UTTBtKpbELdz0CLBa
         YiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035998; x=1784640798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tFXARX4SHAk3PI59oKiV3+pkOUhhlBx2uKmJFHAo6l8=;
        b=oM4xhA1IpsfFSKC9yXrHIN/FciQOM2lFrUZpDMC7xipM30sD7FFIJcl+lqiMTyMyJg
         +t1acQS60P2eoyzcohyfGJvlDkt/qbinbnicPNlzw7O6Lnz+y89im7LDAuHv0sYQRbIf
         wRoY6tiQPlDtXbSr2bemsPK4Cl/QBervWVJPn1WiDjmQwCql7ElPIdRBSxgGXBHjNIw5
         9Hj8ka4xkrH+kd+k12MjxGAiWqEVaJ7le9PjHyvKDjh+W5H4TUcbOiN4ZJh8ojNBI9ZQ
         A4/Lj7kbFM+haRzI+4z1Jjs/brQ7aIQcvl7nIN1ToUP+U+Zc8o38jsOYe0OQJWIc1V71
         bqTA==
X-Gm-Message-State: AOJu0Yz0QC8/NSxZieRKhkbZZq2XNy9ifgKAKxMc96qQxQMhON24lIw0
	n+Acldom+qs1Tu/Qd8rpcJimBEaMYWuC+XYxYbKeZ5NsXZ3Qv6cNvYF8Hu04zXHfdyuHhqMJqmi
	cVOrVPgNcg1tIPI2RWYhLqjFnhtH/Ab5ARu6j6I4=
X-Gm-Gg: AfdE7cldsdSXfHBsAWCc8hQT6qof8AkPussUe5TOM2JCf1//kCPVbg89Nvcf7qV6v6e
	OOJ7tQmfhXkMPorEnKj88C4NzxGcH/4tS8gNPcHvIlOH3D8BgHX9NpGmVsi38uTQ8ngCT3V2U/B
	9zC88WLk2+kqg6KVxsLpiELE0IGbFIQ6gbrNqR5NWp1XWBiD6LdiHOQTg3RfIhs0/KT0XJuE2qu
	yVjiIYz3oICkyJVt8niOXfWGBGKGBME2NjdEFlv98zfRLXzZ/PDNYJI6f/JXozcqjb5KLY6pzo=
X-Received: by 2002:a05:6102:620e:10b0:734:54fa:971d with SMTP id
 ada2fe7eead31-7450c7309f2mr7136897137.7.1784035998246; Tue, 14 Jul 2026
 06:33:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260714120052.255085-1-chlgustn3171@gmail.com> <20260714121819.5FCC91F00A3A@smtp.kernel.org>
In-Reply-To: <20260714121819.5FCC91F00A3A@smtp.kernel.org>
From: chlgustn3171 <chlgustn3171@gmail.com>
Date: Tue, 14 Jul 2026 22:33:06 +0900
X-Gm-Features: AUfX_mziL_YIWK1mOLB4Cx8A5jwVQaeVlfikn-kbN8oMPqwTpHlQFBBl6-mR7M0
Message-ID: <CAO2ma08Pap6PZKUV7iEpvu11zaKrzMK-cgBLBYKJEEfGH+0=1g@mail.gmail.com>
Subject: Re: [PATCH] HID: input: allocate input_dev name/phys/uniq using hid
 device devres
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 9:18=E2=80=AFPM sashiko-bot wrote:
> [Severity: High]
> If a userspace process holds an open file descriptor for the evdev node
> (/dev/input/eventX), the input_dev will outlive the parent hid->dev.
> When the HID device is unbound, devres will free these strings.
>
> Can this cause a use-after-free when userspace later queries the
> name, phys, or uniq strings via ioctl (e.g., EVIOCGNAME)?

Thanks for the review.

Using &hid->dev here is intentional.
Using the input device for devm-managed input_dev strings is
problematic; see CVE-2023-53454, where the allocation was moved to the
HID device because the input device unregister path may still use the
name for uevents.

> [Severity: Low]
> If devm_kstrdup() fails for phys or uniq, the code jumps here to the
> error path. The earlier successful devm_kstrdup() allocations remain
> tied to &hid->dev.
>
> If the caller continues the device probe successfully after this failure,
> will these strings be leaked for the lifetime of the HID device?

The name/phys/uniq copies are attached to &hid->dev, so the clean-up
is handled by HID device devres.
However, if it is better to explicitly unwind, I can add that in v2.

Thanks,
Hyeonsu
