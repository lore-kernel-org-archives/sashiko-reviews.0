Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D744E535A
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 12:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412009; cv=none; b=IIdOuaLSN652gPCOYTQbuVRWP9YAjwqT5zNw/F98NdsBpQlbj6TI2EKp5ZqR4/fc7aSzuRA+oTH5DMe+73gG0Fg95IPo4tGAjlzCY4UfYPJspZWu76RStWjoVFNdMpl6/bfqILfiZX4Rjw33BHRQYHmiwabJSg6yI9NPEBmu1rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412009; c=relaxed/simple;
	bh=hJuhMMpUoJWJGnzKiPhdetzU4DaZqI5sg9OfkjC2pm4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HGMHATIJrevlIZ8c1BWzyu0d+9UoJwk4Wfkt/NkDtTZPj42FPrAFqv1nP2WG6rMHQk+uuEKlftC6hG2qc3w8N1MRKZjwtieZ4qOeOzOmKhsZ2WJfFImPhYNb817VdogtmWBn1HFdXRmxNA5ujxRVzU8v/lfTlw1JJZdW4nsTTKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBV4yXrR; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBV4yXrR"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so4253298eec.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 05:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792412007; x=1793016807; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hJuhMMpUoJWJGnzKiPhdetzU4DaZqI5sg9OfkjC2pm4=;
        b=RBV4yXrRH0toetnv1Iwqeh58ljfZi/66sYkYStjB1xzajaOXl35j9tXcR91eZlnTOB
         qo/SFPOOvgAP3RqqWq/DcYwYbPixaMsUum+cIHBOvq241nMcsuoDjsGvcwK8VxxnrrJx
         9bXsNwUvqrxt1OhizyRN3Xf04Y4iPvKyP2j7jYsNSeV5te9PhxBo3WpMFeMiGJHhZbni
         V/u/mn/eVu2Ph7ILJOqmx3A8t/ZPcT7MpcHW3uTk3il38Lq/1cSDZYP8qrP7fzqqEKif
         OfFPFs596RJ/h51Pm41qQqc52T5FasGhXJcsFz3aOEo+tJVlVZTSNmfdEuZyGRLagSWI
         AiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792412007; x=1793016807;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hJuhMMpUoJWJGnzKiPhdetzU4DaZqI5sg9OfkjC2pm4=;
        b=WIBwr+Yih/Tm8HddYSxexSs60ygkpSIOKgV/hcCcHSAMl9H5YlwMmk90R7fiKFSJkq
         X6Pxplh8sGqIdaOCu6rSeI1pPRaLccCOVqw/pKZtNYr0VcOPogoopn08Ymk38Io2zS8F
         bT1sBQD+sKlMQzWdbaZe/SOT5tB92YxSD6I2qCrUm3UhkeA1+jQFh8qUmNwE6RYLhEkh
         sqDImglAPSrytDYHd2FGtRvsuyX7t0RL1oQh7dcqfQBJwXt/7kRQBCOVm9bcU99jnqER
         1J7Qzp8ZOXT9+MWQtekyl4jQc+WzIFepgfeTl5zY713iwvJuG9MujyDqf0+KIs8Gr1HB
         3cAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWOMJlcShPe/4qypcxeZHWmdzPTgOvH85sBD1w/DfvuqkloR4ZNlr/UD/OvY8g8i1XcUDJuqFXSt1XZrXsGCk=@lists.linux.dev
X-Gm-Message-State: AFq9FYLel+7AhyCZB4hbP+iOCcL+yOsRjNpPj2EoAqBRzHuvPy27lLgr
	rXftbk/mL2nPm7B7G755uGSyBTlA9OUSuYXUZ6XBVwhn0+tFgKF7FXxZ
X-Gm-Gg: AYBFou2lCfsrWziJIg1r5jR9k6azG+PiLMIaDd7Hyat+rmBMCEhWLJXsnL51CGDWTpU
	JHb3KKjEbmuQhWr8AduZW9NaMh3kNq9XdDgdsjjF7NXxPhP7WcvHiRGHPuJG8SpkcjheBx6Do1T
	ZVbs/8T/EpYhJlZaq7atuqfNvU4jR19zUizrdHS2OBCxH+Q4krXwWHx/7spNAdb2mdwXkXL6Ots
	sZKAV2xC79CB8oJuOdMkP/JABcmMC44gaXyE9jeGwMlFGiu/O7GJx6KT55N4PQP3s25/oR4tV0m
	1iZLo1gVOpOHvkPSgH8xFV4JQOBB1QwM0V5evp9X+p/BmlUMFDebvVnhbwFZpn+K4emrbcbVdwv
	uIIIR6rpkJi0dfR4O96KrFf/rvHia4ZfqBjiJOPuN6sSnOT8VXulujWAO7m7ekibQ8BGSJJdVxe
	ERV6cbgYmR7aF8bHoU4celYbVPkhJoCB1HfS5AvCvG30HyYln/0QNdbvtfniXvajjZ11xgm3P7o
	ezovcc7dBV/ob20fg==
X-Received: by 2002:a05:693c:4090:b0:33c:16f1:2e11 with SMTP id 5a478bee46e88-361a146def6mr13433205eec.7.1792412006962;
        Mon, 19 Oct 2026 05:13:26 -0700 (PDT)
Received: from [10.0.2.15] ([136.226.242.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6791sm36460343eec.6.2026.10.19.05.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:13:26 -0700 (PDT)
Message-ID: <c4b6b7cfd51a498df8aaa7f5bc5cef9a0605b733.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] nvme: document the service-time iopolicy sysfs
 attributes
From: Martin George <martinus.gpy@gmail.com>
To: Guixin Liu <kanie@linux.alibaba.com>, sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
Date: Mon, 19 Oct 2026 17:43:23 +0530
In-Reply-To: <acd6eee9-dadb-48e3-9a9d-232a268472d8@linux.alibaba.com>
References: <20261019075607.808947-1-kanie@linux.alibaba.com>
	 <20261019075607.808947-4-kanie@linux.alibaba.com>
	 <sashiko-outbox-176783@kernel.org>
	 <acd6eee9-dadb-48e3-9a9d-232a268472d8@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2026-10-19 at 19:13 +0800, Guixin Liu wrote:
> >=20
> > Should "service-time" also be added to the accepted values for
> > /sys/class/nvme-subsystem/nvme-subsysX/iopolicy?
> >=20
> > =D9=87=D8=A7=DB=8C=DB=8C
> Sure, changed in v3.

Not just /sys/class/nvme-subsystem/nvme-subsysX/iopolicy, but this
should be added to the accepted values in /sys/class/nvme-
subsystem/nvme-subsysX/iopolicies as well.

-Martin
