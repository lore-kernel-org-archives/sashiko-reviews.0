Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E533368BF
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 14:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784904674; cv=pass; b=qdPcBdEyJvkOnpj7BJxKOjjHV9PWEnThr09pp79S4IXt7knVZBjZx18vZ7ekv4M2p0N22EUd9hGAspgrW6di3dHIpH1WOFW6ecIYP9x7jqxloQZdaAUQffBvzlJ5Oal75kjlvsL8pFDLB11VNaZFWos7QJgvfwjtQE6V1B2rZbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784904674; c=relaxed/simple;
	bh=ORwda7HQDo/oTeirKwld1xw5BbSrSHvQCa9Au/NlXdA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=OFcQuOXIE2+MwG2OrZviLWgLCtQW/VFJRD+3mFl0rbyZE4MWLBl7Mp9jXavC8FvteBPJ08B5+4juErQMwLg4cDOBaaRTSD9AwNdkggWFDhfyShtC2KtCt2h7aRAlR9alHXAf6pqgFX3uknzEuYANaQ9JA2TT4dNqCb2cFCMJBd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=CslYz1HG; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="CslYz1HG"
ARC-Seal: i=1; a=rsa-sha256; t=1784904667; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MtaidGjnkZvwIwxaqjR1+6YqPCibBL0zc+XyqtpXLga5XSnl2QMhP3Jy3njQmCSe8w7iv67bopu/6XRQ1dnhBlpDYleqY+Y9sVb/1dYA0wicnu0Xlk/WkPuKP1yqfA0tytHMkw/bpylV5tqCO9A2TFGzfKtvPQBFLC8YjKPuQUc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784904667; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3OtUY+Ukq2pq4qFkEGrCk1dzhMsUkK7Aw7R+u+O9ZFA=; 
	b=Iejwdpf5rZld2g1YDz7rwoox/xoNukb4YydJ26mt9tSIGW2KO/iS3jh/Fo2QFH9cPvYDLx9eZTdAO2x4vFcYSbjRDBIqdSaNs2Sv23iRaWLoEpcTGMD3ZWA0jMAUpJzR531kTJ7TpGyCqMQfljWlXCQZkIn/ayJYtS1Ge+V6j9Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784904667;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=3OtUY+Ukq2pq4qFkEGrCk1dzhMsUkK7Aw7R+u+O9ZFA=;
	b=CslYz1HGH2gXYrQ6eNzN5Rf6GSwkFGzZagB+orS6ioskENQWoWrVaHeQ3EOR7GdH
	vtfIYTmVVntdE52K3VnQrElKexODP2KJGtaHCxgh0ymTjI6J076aXDOgivyJmlWSpVG
	JnWm1Bd4jHfYyVUjhLh0K/t1xDVHHPXb8RRWDwZY=
Received: by mx.zohomail.com with SMTPS id 1784904665802670.7960709146338;
	Fri, 24 Jul 2026 07:51:05 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v9 4/7] drm/tyr: add GPU virtual memory (VM) support
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260723001758.543C31F000E9@smtp.kernel.org>
Date: Fri, 24 Jul 2026 11:50:51 -0300
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>,
 ojeda@kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D71A9DFC-D59A-4133-80D8-34E6F30A127A@collabora.com>
References: <20260722-fw-boot-b4-v9-0-8669d2a02590@collabora.com>
 <20260722-fw-boot-b4-v9-4-8669d2a02590@collabora.com>
 <20260723001758.543C31F000E9@smtp.kernel.org>
To: sashiko-reviews@lists.linux.dev
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 22 Jul 2026, at 21:17, sashiko-bot@kernel.org wrote:
>=20
> Thank you for your contribution! Sashiko AI review found 1 potential =
issue(s) to consider:
> - [High] `map_bo_range` and `unmap_range` do not validate that `va`, =
`map_size`, and `bo_offset` are page-aligned.
> --
>=20
> --- Patch [4]: [PATCH v9 4/7] drm/tyr: add GPU virtual memory (VM) =
support ---
> commit f6b41ad5c64a48e1d1e8176179d981d7c1d18bd9
> Author: Boris Brezillon <boris.brezillon@collabora.com>
>=20
> drm/tyr: add GPU virtual memory (VM) support
>=20
> This commit adds GPU virtual address space management using the DRM =
GPUVM
> framework. Each virtual memory space is backed by ARM64 LPAE Stage 1 =
page
> tables and can be mapped into hardware address space slots for GPU =
execution.
> It provides map, unmap, and remap operations with page table =
synchronization.
>=20
>> diff --git a/drivers/gpu/drm/tyr/vm.rs b/drivers/gpu/drm/tyr/vm.rs
>> new file mode 100644
>> index 0000000000000..c113820b55052
>> --- /dev/null
>> +++ b/drivers/gpu/drm/tyr/vm.rs
>=20
> [ ... ]
>=20
>> +    pub(crate) fn map_bo_range(
>> +        &self,
>> +        bo: &Bo,
>> +        bo_offset: u64,
>> +        map_size: u64,
>> +        va: u64,
>> +        flags: VmMapFlags,
>> +    ) -> Result {
>> +        let bo_size =3D u64::try_from(bo.size()).map_err(|_| =
EOVERFLOW)?;
>> +        let bo_end =3D =
bo_offset.checked_add(map_size).ok_or(EINVAL)?;
>=20
> [Severity: High]
> Does this function need to validate that va, map_size, and bo_offset =
are
> page-aligned before passing them to the DRM GPUVM framework?
>=20
> If unaligned values are passed, drm_gpuvm_sm_map() might successfully =
split
> or remove overlapping mappings in the GPUVM tree during its =
preliminary
> unmap/remap steps.=20
>=20
> However, when it subsequently invokes the driver's sm_step_map(), the
> underlying pt_map() divides the unaligned size by the page size =
(SZ_4K),
> resulting in a page count of 0 for the unaligned remainder.
>=20
> This causes the hardware page table update to fail with ENOMEM or =
EINVAL.
> Because drm_gpuvm does not roll back earlier tree modifications if the =
map
> step fails, could this leave the GPUVM tree out of sync with the =
hardware
> page tables and potentially lead to state inconsistencies or memory =
corruption?
>=20
> [ ... ]
>=20
>> +    pub(crate) fn unmap_range(&self, va: u64, size: u64) -> Result {
>> +        let end =3D va.checked_add(size).ok_or(EINVAL)?;
>=20
> [Severity: High]
> Similarly, should this function verify that va and size are =
page-aligned
> before processing the unmap request?
>=20
> Passing unaligned values here could lead to similar state =
inconsistencies
> between the DRM GPUVM tree and the hardware page tables if the =
underlying
> unmap operations fail or partially complete due to size truncation.
>=20
> [ ... ]
>=20
> --=20
> Sashiko AI review =C2=B7 =
https://sashiko.dev/#/patchset/20260722-fw-boot-b4-v9-0-8669d2a02590@colla=
bora.com?part=3D4

Hmm, we check for alignment at the ioctl level, but I think it doesn=E2=80=
=99t hurt to check it here too.

=E2=80=94 Daniel

